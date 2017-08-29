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

class PullsViewController: UITableViewController {
    
    @IBOutlet weak var openedLabel: UILabel!
    @IBOutlet weak var closedLabel: UILabel!
    
    var repo: String?
    var owner: String?
    
    var opened: Int = 0 {
        didSet {
            openedLabel.text = openedLabel.text!
                .replacingOccurrences(of: "_", with: String(opened))
        }
    }
    
    var closed: Int = 0 {
        didSet {
            closedLabel.text = closedLabel.text!
                .replacingOccurrences(of: "_", with: String(closed))
        }
    }
    
    let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        setupTableView()
        startService()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - API reponse
    
    func onSuccess(pulls: Observable<[Pull]>) {
        loadData(pulls: pulls)
        countPulls(pulls: pulls)
    }
    
    func onError(error: Error?) {
        
    }
    
    // MARK: - Private methods
    
    private func loadData(pulls: Observable<[Pull]>) {
        pulls.bind(to: tableView.rx.items(cellIdentifier: "pullCell")) {
            (index, pull: Pull, cell: PullCell) in
            cell.setValue(pull: pull)
            }
            .disposed(by: disposeBag)
    }
    
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
    
    private func setupNavbar() {
        self.navigationItem.title = repo
    }
    
    private func setupTableView() {
        tableView.delegate = nil
        tableView.dataSource = nil
        
        tableView
            .rx.itemSelected.subscribe { index -> Void in
                if let cell = self.tableView.cellForRow(at: index.element!) as? PullCell {
                    if let url = URL(string: cell.pull?.url ?? "") {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
            .disposed(by: disposeBag)
    }
    
    private func startService() {
        let githubService = Github()
        githubService.fetchPulls(owner: owner ?? "", repo: repo ?? "",
                                 success: self.onSuccess, error: self.onError)
    }
}
