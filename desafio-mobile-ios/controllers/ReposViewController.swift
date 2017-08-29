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


class ReposViewController: UITableViewController {
    
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
    
    func onSuccess(repositories: Observable<[Repository]>) {
        repositories.bind(to: tableView.rx.items(cellIdentifier: "repoCell")) {
            (index, repository: Repository, cell: RepositoryCell) in
            cell.setValue(repository: repository)
        }
        .disposed(by: disposeBag)
    }
    
    func onError(error: Error?) {
        Alert.showError(context: self)
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
    
    // MARK: - Private methods
    
    private func setupNavbar() {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    private func setupTableView() {
        tableView.delegate = nil
        tableView.dataSource = nil
        
        tableView
            .rx.itemSelected.subscribe { index -> Void in
                let cell = self.tableView.cellForRow(at: index.element!)
                self.performSegue(withIdentifier: "pulls", sender: cell)
            }
            .disposed(by: disposeBag)
    }
    
    private func startService() {
        let githubService = Github()
        githubService.fetchRepos(success: self.onSuccess, error: self.onError)
    }

}
