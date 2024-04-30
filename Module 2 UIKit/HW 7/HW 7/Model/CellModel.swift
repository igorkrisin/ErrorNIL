//
//  CellModel.swift
//  HW 7
//
//  Created by Игорь Крысин on 17.04.2024.
//

import Foundation

struct CellModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var circleImage: String
    var nameLabel: String
    var captionLabel: String
    var description: String
    
    static func createData() -> [CellModel] {
        [
            CellModel(image: "ballet", circleImage: "circleImg1", nameLabel: "Имя Фамилия22222222", captionLabel: "Заголовок1", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore "),
            CellModel(image: "darkWoman", circleImage: "circleImg2", nameLabel: "Имя Фамилия", captionLabel: "Заголовок2", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
        ]
    }
}
