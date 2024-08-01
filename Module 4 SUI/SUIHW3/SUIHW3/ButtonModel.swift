//
//  ButtonModel.swift
//  SUIHW3
//
//  Created by Игорь Крысин on 26.07.2024.
//

import Foundation

struct ButtonModel: Identifiable {
    var id: String = UUID().uuidString
    var nameBtn: String
    
    static func mokeDate() -> [ButtonModel] {
        [
            ButtonModel(nameBtn: "Природа"),
            ButtonModel(nameBtn: "Погода"),
            ButtonModel(nameBtn: "Трактор"),
            ButtonModel(nameBtn: "Гусеницы"),
            ButtonModel(nameBtn: "Природа"),
            ButtonModel(nameBtn: "Погода"),
            ButtonModel(nameBtn: "Трактор"),
            ButtonModel(nameBtn: "Природа"),
            ButtonModel(nameBtn: "Гусеницы"),
        
        
        ]
    }
}
