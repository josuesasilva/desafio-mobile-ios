//
//  PullsViewController.swift
//  desafio-mobile-ios
//
//  Created by Josué on 26/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import AlamofireObjectMapper

class PullsViewController: BaseViewController {
    
    @IBOutlet weak var openedLabel: UILabel!
    @IBOutlet weak var closedLabel: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var repo: String?
    var owner: String?
    var pulls: Variable<[Pull]> = Variable([])
    
    var opened: Int = 0 {
        didSet {
            setHeader(label: openedLabel, value: opened)
        }
    }
    
    var closed: Int = 0 {
        didSet {
            setHeader(label: closedLabel, value: closed)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView(loadingView: self.loading, completion: { index in
            if let cell = self.tableView.cellForRow(at: index!) as? PullCell {
                if let url = URL(string: cell.pull?.url ?? "") {
                    UIApplication.shared.openURL(url)
                }
            }
        })
        startService()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func setupNavbar() {
        self.navigationItem.title = repo
    }
    
    override func startService() {
        let githubService = Github()
        githubService.fetchPulls(owner: owner ?? "", repo: repo ?? "", page: self.currentPage,
                                 success: self.onSuccess, error: self.onError)
    }
    
    // MARK: - API reponse
    
    func onSuccess(pulls: [Pull]) {
        self.pulls.value.append(contentsOf: pulls)
        self.loadDataSource(tableView: self.tableView,
                            data: self.pulls,
                            cellId: "pullCell",
                            completion: { item, cell in
                                if let c = cell as? PullCell {
                                    c.setValue(pull: item)
                                    self.countPulls(pulls: self.pulls.asObservable())
                                    self.loadingStatus = false
                                }
        })
    }
    
    func onError(error: Error?) {
        Alert.showError(context: self)
        self.loadingStatus = false
    }
    
    // MARK: - Private methods
    
    private func countPulls(pulls: Observable<[Pull]>) {
        // results will update by page
        pulls.subscribe { i in
            let array = i.element?.filter{ p -> Bool in p.state == "open" }
            if let size = array?.count {
                self.opened += size
                if let total = i.element?.count {
                    self.closed += (total - size)
                }
            }
            }.addDisposableTo(disposeBag)
    }
    
    private func setHeader(label: UILabel, value: Int) {
        label.text = label.text!
            .replacingOccurrences(of: "_", with: String(value))
    }
    
}
