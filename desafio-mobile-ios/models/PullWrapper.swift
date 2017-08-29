//
//  PullWrapper.swift
//  desafio-mobile-ios
//
//  Created by Josué on 28/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import ObjectMapper

class PullWrapper: Mappable {
    
    var items: [Pull]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        items <- (map.currentValue as! Map)
    }
    
}
