//
//  AppDelegate.swift
//  desafio-mobile-ios
//
//  Created by Josué on 25/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        return true
    }

}

