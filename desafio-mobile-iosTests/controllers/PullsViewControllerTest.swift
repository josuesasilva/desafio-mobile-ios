//
//  PullsViewController.swift
//  desafio-mobile-ios
//
//  Created by Josué on 31/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import XCTest
@testable import desafio_mobile_ios


class PullsViewControllerTest: XCTestCase {
    
    var viewControllerUnderTest: PullsViewController?
    
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewControllerUnderTest = storyboard.instantiateViewController(
            withIdentifier: "PullsViewController") as? PullsViewController {
            viewControllerUnderTest.viewDidLoad()
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
