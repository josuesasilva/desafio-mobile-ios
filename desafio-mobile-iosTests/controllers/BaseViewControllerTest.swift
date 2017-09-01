//
//  BaseViewControllerTest.swift
//  desafio-mobile-ios
//
//  Created by Josué on 31/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import XCTest
@testable import desafio_mobile_ios

class BaseViewControllerTest: XCTestCase {
    
    var viewControllerUnderTest: BaseViewController?
    var loadingView: UIActivityIndicatorView?
    
    override func setUp() {
        super.setUp()
        viewControllerUnderTest = BaseViewController()
        viewControllerUnderTest?.viewDidLoad()
        loadingView = UIActivityIndicatorView(frame: CGRect.init())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCurrentPage() {
        XCTAssertEqual(viewControllerUnderTest?.currentPage, 1)
    }
    
    func testLoadingStatus() {
        XCTAssertEqual(viewControllerUnderTest?.loadingStatus, false)
    }
    
    func testSetupTableView() {
        viewControllerUnderTest?.setupTableView(loadingView: loadingView!, completion: { _ in })
        XCTAssertEqual(viewControllerUnderTest?.loadingView?.isAnimating, false)
        viewControllerUnderTest?.loadingStatus = true
        XCTAssert((viewControllerUnderTest?.loadingView?.isAnimating)!)
    }
    
}
