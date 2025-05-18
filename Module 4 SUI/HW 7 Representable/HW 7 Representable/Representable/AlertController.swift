//
//  AlertController.swift
//  HW 7 Representable
//
//  Created by Игорь Крысин on 13.08.2024.
//

import SwiftUI

struct AlertController: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
      print("update uiController")
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let alert = UIAlertController()
        alert.title = " Error"
        alert.message = "message"
        
        let okBtn: UIAlertAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okBtn )
        return alert
    }
    
}
