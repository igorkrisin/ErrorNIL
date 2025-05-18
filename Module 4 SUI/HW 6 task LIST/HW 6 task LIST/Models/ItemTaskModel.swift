//
//  ItemTaskModel.swift
//  HW 6 task LIST
//
//  Created by Игорь Крысин on 04.08.2024.
//
//При нажатии идет переход внутрь записи, где через форму уже  будет список пунктов текущего дела, возможность отметить, выполнено или нет и так же возможность добавить новый пункт для выполнения.
import Foundation

struct ItemTaskModel: Identifiable {
    let id = UUID()
    var date: Date
    var description: String
    
    static func mokeData() -> [ItemTaskModel] {
        [
            ItemTaskModel(date: Date.now, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit"),
            ItemTaskModel(date: Date.now, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut"),
            ItemTaskModel(date: Date(), description: "olore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit"),
            ItemTaskModel(date: Date.now, description: "Lorem ipsum dolor sit amet. Duis aute irure dolor in reprehenderit"),
        ]
    }
    
}
