//
//  Pull.swift
//  desafio-mobile-ios
//
//  Created by Josué on 28/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import ObjectMapper

class Pull: Mappable {

    var user: User?
    var title: String?
    var body: String?
    var url: String?
    var state: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        state <- map["state"]
        url <- map["html_url"]
        user <- map["user"]
        title <- map["title"]
        body <- map["body"]
    }
    
}
