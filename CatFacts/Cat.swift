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
}
