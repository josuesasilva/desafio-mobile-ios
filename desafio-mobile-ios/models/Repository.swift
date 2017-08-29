//
//  Repository.swift
//  desafio-mobile-ios
//
//  Created by Josué on 28/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import ObjectMapper

class Repository: Mappable {
    
    var name: String?
    var description: String?
    var forks: Int?
    var stars: Int?
    var owner: User?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        forks <- map["forks"]
        stars <- map["stargazers_count"]
        owner <- map["owner"]
    }
}
