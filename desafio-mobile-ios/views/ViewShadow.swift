//
//  ViewShadow.swift
//  desafio-mobile-ios
//
//  Created by Josué on 26/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit

class ViewShadow: UIView {

    override func draw(_ rect: CGRect) {
        updateLayerProperties()
    }
    
    func updateLayerProperties() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 2.0
        self.layer.masksToBounds = false
    }

}
