//
//  ViewController.swift
//  RealmProject
//
//  Created by Игорь Крысин on 25.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let realmMAnager = RealmManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
       
        
        realmMAnager.deleteNote(id: realmMAnager.notes.first?.id ?? "")
        print(realmMAnager.notes.first?.text)
        
//        let note = Note()
//        note.header = "Header text"
//        note.text = "note text"
//        note.image = "image note"
//        realmMAnager.createNote(note: note)
//        
//        print(FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first)
     
    }


}

