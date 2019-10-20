//
//  Cat.swift
//  CatFacts
//
//  Created by Виктория Воробьева on 20/10/2019.
//  Copyright © 2019 Виктория Воробьева. All rights reserved.
//

struct Information: Decodable {
    let fact: String?
    let length: Int
}

struct Cat: Decodable {
    let total: Int?
    let per_page: String?
    let current_page: Int?
    let last_page: Int?
    let next_page_url: String?
    let from: Int?
    let to: Int?
    let data: [Information]?
}
