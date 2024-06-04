//
//  Model.swift
//  MyParseJson
//
//  Created by Игорь Крысин on 01.06.2024.
//

import Foundation

struct Episodes: Decodable {
    let info: Info?
    let results: [Results]
    
    
}

struct Info: Decodable  {
    let count: Int?
    let pages: Int?
    let nextUrl: String?
    
}

struct Results: Decodable {
    let name: String?
    let air_date: String?
    let characters: [String?]
    let url: String?
    let created: String?
    let id: Int?
    
}
