//
//  AuthFireBaseModel.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 10.06.2024.
//

import Foundation
import FirebaseAuth

final class AuthFireBaseModel {
    func singIn(userData: AuthUserData, completion: @escaping (Result<UserVerification,Error>) -> Void) {
        Auth.auth().signIn(withEmail: userData.email, password: userData.password) { result, err in
            
           
            
            guard err == nil else {
                completion(.failure(err!))
                return
            }
            
            if let isVerify  = result?.user.isEmailVerified, isVerify  {
                completion(.success(.verifier))
            } else {
                completion(.success(.noverifier))
            }
        }
    }
}

struct AuthUserData {
    let email: String
    let password: String
}

enum UserVerification {
    case verifier, noverifier
}
