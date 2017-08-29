//
//  DetailViewController.swift
//  desafio-mobile-ios
//
//  Created by Josué on 26/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import AlamofireObjectMapper

class DetailViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = nil
        tableView.dataSource = nil
        
        let githubService = Github()
        githubService.fetchPulls(owner: "", repo: "", success: self.onSuccess, error: self.onError)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - API reponse
    
    func onSuccess(pulls: Observable<[Pull]>) {
        pulls.bind(to: tableView.rx.items(cellIdentifier: "pullCell")) {
            (index, pull: Pull, cell: PullCell) in
            cell.setValue(pull: pull)
            }
            .disposed(by: disposeBag)
    }
    
    func onError(error: Error?) {
        
    }
}
