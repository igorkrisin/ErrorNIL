//
//  RegistrationModel.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 26.05.2024.
//

import Foundation

struct RegistrationModel {
    var captionLabel: String
    var acceptPrivacy: String
    var haveAccountLabel: String
    
    static func makeData() -> RegistrationModel {
        RegistrationModel(captionLabel: "Регистрация", acceptPrivacy: "Я согласен с Условиями предоставления услуг и Политикой конфиденциальности", haveAccountLabel: "Уже есть аккаунт?")
    }
}
