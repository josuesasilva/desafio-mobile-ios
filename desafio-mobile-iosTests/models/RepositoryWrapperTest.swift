//
//  RepositoryWrapperTest.swift
//  desafio-mobile-ios
//
//  Created by Josué on 31/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import desafio_mobile_ios

class RepositoryWrapperTest: XCTestCase {
    
    var user: User?
    
    override func setUp() {
        super.setUp()
        user = User(JSON: ["name": "ReactiveX", "avatar": "https://avatars1.githubusercontent.com/u/6407041?v=4"])
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMapsData() {
        let jsonDictionary: [String: Any] = ["items": [["name": "RxJava", "description": "RxJava – Reactive Extensions...", "forks": 4747, "stargazers_count": 26961, "owner": user!]]]
        let repo = Mapper<RepositoryWrapper>().map(JSON: jsonDictionary)
        
        XCTAssertEqual(repo?.items?.count, 1)
    }

    
}
