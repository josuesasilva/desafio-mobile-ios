//
//  UserTest.swift
//  desafio-mobile-ios
//
//  Created by Josué on 31/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import desafio_mobile_ios

class UserTest: XCTestCase {
    
    func testMapsData() {
        let jsonDictionary: [String: Any] = ["login": "ReactiveX", "avatar_url": "https://avatars1.githubusercontent.com/u/6407041?v=4"]
        let user = Mapper<User>().map(JSON: jsonDictionary)
        
        XCTAssertEqual(user?.name, "ReactiveX")
        XCTAssertEqual(user?.avatar, "https://avatars1.githubusercontent.com/u/6407041?v=4")
    }
    
}
