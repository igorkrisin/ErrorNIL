//
//  Service.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 27.05.2024.
//

import Foundation
import FirebaseAuth

class Service {
    static let shared = Service()
    private init() {}
    
    var nickName: String?
    var email: String?
    var userPassword: String?
    
    var uid: String? {
        get {
            Auth.auth().currentUser?.uid
        }
    }
}
