//
//  PofileModelCell.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 27.05.2024.
//

import Foundation

struct ProfileModelCell {
    
    static var idCell: String = "profileCell"
    
    var icon: String
    var nameCell: String
    
    
    static func makeTableData() -> [ProfileModelCell] {
        [
            ProfileModelCell(icon: "person", nameCell: "Мой аккаунт"),
            ProfileModelCell(icon: "gearshape", nameCell: "Настройки"),
            ProfileModelCell(icon: "questionmark.circle", nameCell: "Помощь")
        ]
    }
}
