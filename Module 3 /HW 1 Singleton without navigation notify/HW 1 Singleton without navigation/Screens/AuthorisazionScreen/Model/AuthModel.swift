//
//  AuthModel.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 26.05.2024.
//

import Foundation

struct AuthModel {
    var captionLabel: String
    var dontHaveAccountLabel: String
    
    static func makeData() -> AuthModel {
        AuthModel(captionLabel: "Войти", dontHaveAccountLabel: "У вас нет аккаунта?")
    }
}
