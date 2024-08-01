//
//  Model.swift
//  HW2Sui
//
//  Created by Игорь Крысин on 23.07.2024.
//

import Foundation

struct ModelItemTable: Identifiable {
    var id: String = UUID().uuidString
    var profileImage: String
    var userName: String
    var description: String
    var icon: String
    var timeDescription: String
    var price: String
    
    static func mokeData() -> [ModelItemTable] {
        [
            ModelItemTable(profileImage: "profileImg",userName: "petya zsbolotskyi", description: "bla bla bla", icon: "clock", timeDescription: "dsfsdfsdfds", price: "$499"),
        ModelItemTable(profileImage: "profileImg", userName: "anya zsbolotskyi", description: "bla bla 3434", icon: "clock", timeDescription: "jghjhgjjghj", price: "$399"),
        ModelItemTable(profileImage: "profileImg", userName: "vanya zsbolotskyi", description: "bla bla 56565", icon: "clock", timeDescription: "jijlklkj", price: "$299"),
        
        ]
    }
}
