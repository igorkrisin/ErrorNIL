//
//  ProfileModel.swift
//  HW 11
//
//  Created by Игорь Крысин on 06.05.2024.
//

import Foundation

struct ProfileModel {
    var imageProfile: String
    var nameUser: String
    var age: String
    var birtday: String
    var country: String
    
    static func makeItem() -> ProfileModel {
        return ProfileModel(imageProfile: "image1", nameUser: "Имя Фамилия", age: "Возраст: 18", birtday: "День рождения: 23.03.2023", country: "Страна проживнания: Россия")
    }
    
}
