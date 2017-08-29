//
//  User.swift
//  desafio-mobile-ios
//
//  Created by Josué on 28/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import ObjectMapper

class User: Mappable {
    
    var name: String?
    var avatar: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["login"]
        avatar <- map["avatar_url"]
    }
}
