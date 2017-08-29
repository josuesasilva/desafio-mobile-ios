//
//  Alert.swift
//  desafio-mobile-ios
//
//  Created by Josué on 29/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit

class Alert: NSObject {
    
    static func showError(context: UIViewController) {
        let alertController = UIAlertController(title: "Oops!", message:
            "Sorry, could not connect to service. Try again later.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default,handler: nil))
        context.present(alertController, animated: true, completion: nil)
    }
}
