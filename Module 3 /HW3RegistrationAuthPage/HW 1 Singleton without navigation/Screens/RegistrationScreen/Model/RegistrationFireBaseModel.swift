//
//  RegistrationFireBaseModel.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 09.06.2024.
//

import Foundation
import Firebase

class RegistrationFireBaseModel {
    
    func userRegistration(userData: UserData, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: userData.email, password: userData.password) { [weak self] result, err in
            guard err == nil else {
                completion(.failure(err!))
                return
            }
            
            if let uid = result?.user.uid {
                result?.user.sendEmailVerification()//отправка письма верификации
                self?.setUserData(uid: uid, name: userData.name)
                completion(.success(true))
            } 
            
        }
    }
    
    func setUserData(uid: String, name: String) {
        
        let userData: [String: Any] = [
            "name": name,
            
        ]
        
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .setData(userData)
    }
    
}

struct UserData {
    let name: String
    let email: String
    let password: String
}
