//
//  Cat.swift
//  CatFacts
//
//  Created by Виктория Воробьева on 20/10/2019.
//  Copyright © 2019 Виктория Воробьева. All rights reserved.
//

struct Information: Decodable {
    let fact: String?
    
    init(dict: [String : Any]) {
        fact = dict["fact"] as? String
    }
    
    static func getCat(from value: Any) -> [Information] {
        guard let jsonData = value as? [String: Any] else { return [] }
        guard let data = jsonData["data"] as? Array<[String: Any]> else { return [] }
        
        var information: [Information] = []
        
        for dict in data {
            let catInfo = Information(dict: dict)
            information.append(catInfo)
        }
        return information
    }
}
