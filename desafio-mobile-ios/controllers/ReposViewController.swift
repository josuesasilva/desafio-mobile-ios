//
//  HomeViewController.swift
//  desafio-mobile-ios
//
//  Created by Josué on 26/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class RepositoriesViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = nil
        tableView.dataSource = nil
        
        let githubService = Github()
        githubService.fetchRepos(success: self.onSuccess, error: self.onError)
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
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }

}
