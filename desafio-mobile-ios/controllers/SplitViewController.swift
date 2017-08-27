//
//  SplitViewController.swift
//  desafio-mobile-ios
//
//  Created by Josué on 26/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }

}
