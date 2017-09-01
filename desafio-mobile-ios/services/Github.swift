//
//  Github.swift
//  desafio-mobile-ios
//
//  Created by Josué on 28/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import AlamofireObjectMapper

class Github: NSObject {
    
    let baseUrl = "https://api.github.com"
    let reposUrl = "/search/repositories"
    let pullsUrl = "/repos"

    func fetchRepos(q: String = "language:Java", sort: String = "stars",
                    page: Int = 1,
                    success: @escaping ([Repository]) -> Void,
                    error: @escaping (Error?) -> Void) {
        
        let url = URL(string: "\(baseUrl)\(reposUrl)?q=\(q)&sort=\(sort)&page=\(page)")!
    
        Alamofire.request(url)
            .responseObject { (res: DataResponse<RepositoryWrapper>) in
                if (res.result.value != nil) && res.result.isSuccess {
                    if let result = res.result.value?.items {
                        success(result)
                    } else {
                        error(nil)
                    }
                } else {
                    error(res.error)
                }
            }
        
    }
    
    func fetchPulls(owner: String, repo: String, page: Int = 1,
                    success: @escaping ([Pull]) -> Void,
                    error: @escaping (Error?) -> Void) {
        
        let url = URL(string: "\(baseUrl)\(pullsUrl)/\(owner)/\(repo)/pulls?state=all&page=\(page)")!
        
        Alamofire.request(url)
            .responseArray { (res: DataResponse<[Pull]>) in
                if (res.result.value != nil) && res.result.isSuccess {
                    success(res.result.value ?? [])
                } else {
                    error(res.error)
                }
        }
        
    }

}

