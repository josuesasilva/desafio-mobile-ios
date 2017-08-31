//
//  RepositoryTest.swift
//  desafio-mobile-ios
//
//  Created by Josué on 31/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import desafio_mobile_ios

class RepositoryTest: XCTestCase {
    
    var user: User?
    var data: [String:Any]?
    
    override func setUp() {
        super.setUp()
        user = User(JSON: ["name": "ReactiveX", "avatar": "https://avatars1.githubusercontent.com/u/6407041?v=4"])
        data = ["name": "RxJava", "description": "RxJava – Reactive Extensions...", "forks": 4747, "stargazers_count": 26961, "owner": user!]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitData() {
        let repo = Repository(JSON: data!)
        XCTAssertEqual(repo?.name, "RxJava")
        XCTAssertEqual(repo?.description, "RxJava – Reactive Extensions...")
        XCTAssertEqual(repo?.forks, 4747)
        XCTAssertEqual(repo?.stars, 26961)
        XCTAssertEqual(repo?.owner?.name, user?.name)
    }
    
    func testMapsData() {
        let repo = Mapper<Repository>().map(JSON: data!)
        XCTAssertEqual(repo?.name, "RxJava")
        XCTAssertEqual(repo?.description, "RxJava – Reactive Extensions...")
        XCTAssertEqual(repo?.forks, 4747)
        XCTAssertEqual(repo?.stars, 26961)
        XCTAssertEqual(repo?.owner?.name, user?.name)
    }
    
}
