//
//  Model.swift
//  HW 6
//
//  Created by Игорь Крысин on 13.04.2024.
//

import Foundation

struct Item: Identifiable {
    var id = UUID().uuidString
    var nameLabel: String
    var description: String
    var mainImage: String
    var listImage: [String]
    
    static func createArrayData() -> [Item] {
        [
            Item(nameLabel: "Имя1 Фамилия1", description: "Lorembbb ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt",mainImage: "window_man" ,listImage: ["furniture", "hand", "furniture"]),
            Item(nameLabel: "Имя2 Фамилия2", description: "Loremaaaa ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt",mainImage: "kitchen" ,listImage: ["kitchen", "many_circle", "furniture"]),
            Item(nameLabel: "Имя3 Фамилия3", description: "Loremcccc ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt",mainImage: "surf" ,listImage: ["furniture", "furniture", "woman"])
        ]
    }
    
}
