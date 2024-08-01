//
//  Service.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 27.05.2024.
//

import Foundation

class Service {
    static let shared = Service()
    
    private init() {}
    
    var email: String?
    var userPassword: String?
}
