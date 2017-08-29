//
//  RepositoryWrapper.swift
//  desafio-mobile-ios
//
//  Created by Josué on 28/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import ObjectMapper

class RepositoryWrapper: Mappable {
    
    var items: [Repository]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
}
