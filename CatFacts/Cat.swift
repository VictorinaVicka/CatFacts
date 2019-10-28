//
//  Cat.swift
//  CatFacts
//
//  Created by Виктория Воробьева on 20/10/2019.
//  Copyright © 2019 Виктория Воробьева. All rights reserved.
//

struct Information: Decodable {
    let fact: String?
}

struct Cat: Decodable {
    let data: [Information]?
    
    init(dict: [String : Any]) {
        let dataCat = dict["data"] as? [String : String]
        let dataValue = Information(fact: dataCat?["fact"])
        
        let data = dataValue
        
        self.data = [data]
    }
    
    static func getCat(from value: Any) -> Cat? {
        guard let jsonData = value as? ([String: Any]) else { return nil}
        var cat: Cat?
        
        for (other,fact) in jsonData {
            let catInfo = Cat(dict: [other:fact])
            cat = catInfo
        }
        return cat
    }
}
