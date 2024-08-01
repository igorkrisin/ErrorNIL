//
//  ItemModel.swift
//  SUIHW3
//
//  Created by Игорь Крысин on 26.07.2024.
//

import Foundation

struct ItemModel: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    
    static func mokeData() -> [ItemModel] {
        [
        ItemModel(image: "nature1"),
        ItemModel(image: "nature2"),
        ItemModel(image: "nature3"),
        ItemModel(image: "nature4"),
        ItemModel(image: "nature5"),
        ItemModel(image: "nature6"),
        ]
    }
    
}
