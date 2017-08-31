//
//  ReposViewController.swift
//  desafio-mobile-ios
//
//  Created by Josué on 26/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ReposViewController: BaseViewController {
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    let githubService = Github()
    
    var repositories: Variable<[Repository]> = Variable([])
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView(loadingView: self.loading, completion: { index in
            let cell = self.tableView.cellForRow(at: index)
            self.performSegue(withIdentifier: "pulls", sender: cell)
        })
        startService()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func startService() {
        githubService.fetchRepos(page: self.currentPage, success: self.onSuccess, error: self.onError)
    }
    
    // MARK: - API reponse
    
    func onSuccess(repositories: [Repository]) {
        self.repositories.value.append(contentsOf: repositories)
        self.loadDataSource(tableView: self.tableView,
                            data: self.repositories,
                            cellId: "repoCell",
                            completion: { item, cell in
                                if let c = cell as? RepositoryCell {
                                    c.setValue(repository: item)
                                    self.loadingStatus = false
                                }
        })
    }
    
    func onError(error: Error?) {
        Alert.showError(context: self)
        self.loadingStatus = false
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "pulls") {
            let nav = segue.destination as! UINavigationController
            let vc = nav.viewControllers[0] as! PullsViewController
            let cell = sender as! RepositoryCell
            vc.repo = cell.repository?.name
            vc.owner = cell.repository?.owner?.name
        }
    }

}
