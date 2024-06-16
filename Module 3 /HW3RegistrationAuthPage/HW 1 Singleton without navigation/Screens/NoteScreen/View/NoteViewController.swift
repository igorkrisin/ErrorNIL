//
//  NoteViewController.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 14.06.2024.
//

import UIKit

class NoteViewController: UIViewController {
    
    lazy var barButton: UIBarButtonItem = {
        return $0
    }(UIBarButtonItem(image: .actions, style: .plain, target: self, action: #selector(addBtnAction)))
    
    lazy private var alertController: UIAlertController = { alert in
        alert.addTextField { field in
            field.placeholder = "note"
            
        }
        
        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { _ in
            let textField = alert.textFields?[0].text
        }))
        return alert
    }(UIAlertController(title: "Записать заметку", message:  "Добавить новую заметку", preferredStyle: .alert))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        navigationItem.rightBarButtonItem = barButton
       
    }
      
    @objc func addBtnAction() {
        present(alertController, animated: true)
    }
    
}
