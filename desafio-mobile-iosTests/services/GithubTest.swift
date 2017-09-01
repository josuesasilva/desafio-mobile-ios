//
//  GithubTest.swift
//  desafio-mobile-ios
//
//  Created by Josué on 31/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import XCTest
import Mockingjay
@testable import desafio_mobile_ios

class GithubTest: XCTestCase {
    
    var service: Github?
    var reposData: Data?
    var pullsData: Data?
    
    override func setUp() {
        super.setUp()
        service = Github()
        
        if let fileReposPath = Bundle(for: type(of: self)).path(forResource: "repositories", ofType: "json") {
            do {
                try reposData = Data(contentsOf: URL(string: fileReposPath)!)
            } catch { return }
        } else { return }
        
        if let filePullsPath = Bundle(for: type(of: self)).path(forResource: "pulls", ofType: "json") {
            do {
                try pullsData = Data(contentsOf: URL(string: filePullsPath)!)
            } catch { return }
        } else { return }
        
        stub(uri("/search/repositories"), jsonData(reposData!))
        stub(uri("/pulls"), jsonData(pullsData!))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchRepos() {
        let repos = expectation(description: "fetch repos")
        
        service?.fetchRepos(success: { data in
            XCTAssertEqual(data.count, 30)
            XCTAssertEqual(data[0].name, "RxJava")
            repos.fulfill()
        }, error: { _ in
            repos.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchReposNotFound() {
        let repos = expectation(description: "fetch repos")
        
        service?.fetchRepos(q: "language:ASD",success: { data in
            repos.fulfill()
        }, error: { error in
            XCTAssertNil(error)
            repos.fulfill()
        })
        
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testFetchPulls() {
        let pulls = expectation(description: "fetch pulls")
        
        service?.fetchPulls(owner: "ReactiveX", repo: "RxJava", success: { data in
            XCTAssertEqual(data.count, 30)
            XCTAssertEqual(data[0].title, "2.x: add Maybe null test cases")
            pulls.fulfill()
        }, error: { _ in
            pulls.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchPullsNotFound() {
        let pulls = expectation(description: "fetch pulls")
        
        service?.fetchPulls(owner: "asd", repo: "asdfgh123", success: { data in
            pulls.fulfill()
        }, error: { error in
            XCTAssert(error != nil)
            pulls.fulfill()
        })
        
        waitForExpectations(timeout: 30, handler: nil)
    }
    
}
