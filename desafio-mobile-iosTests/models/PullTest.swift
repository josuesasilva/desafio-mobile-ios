//
//  PullTest.swift
//  desafio-mobile-ios
//
//  Created by Josué on 31/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import desafio_mobile_ios

class PullTest: XCTestCase {
    
    var user: User?
    var data: [String: Any]?
    
    override func setUp() {
        super.setUp()
        user = User(JSON: ["name": "ReactiveX", "avatar": "https://avatars1.githubusercontent.com/u/6407041?v=4"])
        data = ["title": "2.x: add Maybe null test cases", "body": "Add Maybe null test cases.", "user": user!, "html_url": "https://github.com/ReactiveX/RxJava/pull/5579", "state": "closed"]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitData() {
        let pull = Pull(JSON: data!)
        XCTAssertEqual(pull?.user?.name, user?.name)
        XCTAssertEqual(pull?.title, "2.x: add Maybe null test cases")
        XCTAssertEqual(pull?.body, "Add Maybe null test cases.")
        XCTAssertEqual(pull?.url, "https://github.com/ReactiveX/RxJava/pull/5579")
        XCTAssertEqual(pull?.state, "closed")
    }
    
    func testMapsData() {
        let pull = Mapper<Pull>().map(JSON: data!)
        XCTAssertEqual(pull?.user?.name, user?.name)
        XCTAssertEqual(pull?.title, "2.x: add Maybe null test cases")
        XCTAssertEqual(pull?.body, "Add Maybe null test cases.")
        XCTAssertEqual(pull?.url, "https://github.com/ReactiveX/RxJava/pull/5579")
        XCTAssertEqual(pull?.state, "closed")
    }
    
}
