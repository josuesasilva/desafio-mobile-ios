//
//  GithubTest.swift
//  desafio-mobile-ios
//
//  Created by Josué on 31/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import XCTest
@testable import desafio_mobile_ios

class GithubTest: XCTestCase {
    
    var service: Github?
    
    override func setUp() {
        super.setUp()
        service = Github()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchRepos() {
        
    }
    
    func testFetchPulls() {
        
    }
    
}
