//
//  AppModel.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 12.06.2024.
//

import Foundation
import FirebaseAuth

class AppModel {
    func isUserLogin() -> Bool {
        if let _ = Auth.auth().currentUser?.uid {
            return true
        }
        
        return false
    }
    
    func logOut() {
        do { 
            try Auth.auth().signOut()
            NotificationCenter.default.post(name: .setRoot, object: nil)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
