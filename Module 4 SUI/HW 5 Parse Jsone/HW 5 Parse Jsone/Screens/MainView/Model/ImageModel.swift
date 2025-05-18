//
//  ImageModel.swift
//  HW 5 Parse Jsone
//
//  Created by Игорь Крысин on 02.08.2024.
//

import Foundation

struct ImageModel: Decodable {
    let results: [Results]
    let total: Int
    let total_pages: Int
    
}

struct Results: Identifiable, Decodable {
    let id: String?
    let urls: URLS?
    let description: String?
    let alt_description: String?
}

struct URLS: Decodable {
    let small: String?
    let thumb: String?
    
}
