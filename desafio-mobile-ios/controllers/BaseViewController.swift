//
//  BaseViewController.swift
//  desafio-mobile-ios
//
//  Created by Josué on 30/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class BaseViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    var currentPage: Int = 1;
    var loadingView: UIActivityIndicatorView?
    
    var loadingStatus: Bool = false {
        didSet {
            if (loadingStatus) {
                if let view = loadingView {
                    view.startAnimating()
                }
            } else {
                if let view = loadingView {
                    view.stopAnimating()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        startService()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        currentPage = 1;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupNavbar() {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    func loadCells(tableView: UITableView,
                           completion: @escaping (IndexPath) -> Void) {
        tableView.delegate = nil
        tableView.dataSource = nil
        
        tableView
            .rx.itemSelected.subscribe { index -> Void in
                if let i = index.element {
                    completion(i)
                }
            }
            .disposed(by: disposeBag)
    }
    
    func willPaginate(tableView: UITableView) {
        tableView.delegate = nil
        tableView.dataSource = nil
        
        let loadNextPageTrigger = tableView.rx
            .contentOffset
            .flatMap { offset in
                TableView.isNearTheBottomEdge(contentOffset: offset, tableView)
                    ? Observable.just()
                    : Observable.empty()
        }
        
        loadNextPageTrigger.debounce(1, scheduler: MainScheduler.asyncInstance)
            .subscribe { _ in
                self.currentPage += 1
                self.loadingStatus = true
                self.startService()
            }.disposed(by: disposeBag)
    }
    
    func loadDataSource<T>(tableView: UITableView,
                                data: Variable<[T]>,
                                cellId: String,
                                completion: @escaping (T, UITableViewCell) -> Void) {
        tableView.delegate = nil
        tableView.dataSource = nil
        
        data.asObservable().bind(to: tableView.rx.items(cellIdentifier: cellId)) {
            (_, element: T, cell: UITableViewCell) in
            completion(element, cell)
            }
            .disposed(by: disposeBag)
    }
    
    func startService() {
        
    }
    
    func setupTableView(loadingView: UIActivityIndicatorView,
                                completion: @escaping (IndexPath?) -> Void) {
        self.loadingView = loadingView
        self.loadCells(tableView: self.tableView, completion: completion)
        self.willPaginate(tableView: self.tableView)
    }

}
