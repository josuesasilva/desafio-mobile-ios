//
//  ReposViewControllerTest.swift
//  desafio-mobile-ios
//
//  Created by Josué on 31/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import XCTest
@testable import desafio_mobile_ios


class ReposViewControllerTest: XCTestCase {
    
    var viewControllerUnderTest: ReposViewController?
    
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewControllerUnderTest = storyboard.instantiateViewController(
            withIdentifier: "ReposViewController") as? ReposViewController {
            viewControllerUnderTest.viewDidLoad()
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
