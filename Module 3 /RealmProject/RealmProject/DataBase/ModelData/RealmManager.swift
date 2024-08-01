//
//  RealmManager.swift
//  RealmProject
//
//  Created by Игорь Крысин on 25.06.2024.
//

import Foundation
import RealmSwift

class RealmManager {
    //CRUD
    
    let realm = try! Realm()
    var notes: [Note] = []
    
    init() {
        readNote()
    }
    
    func createNote(note: Note) {
        do {
            try realm.write{
                realm.add(note)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readNote() {
        let notes = realm.objects(Note.self)
        self.notes = Array(notes)
        
    }
    
    func updateNote(id: String, newText: String) {
        let note = realm.object(ofType: Note.self, forPrimaryKey: id)
        
        try? realm.write {
            note?.text = newText
        }
    }
    
    func deleteNote(id: String) {
        guard let note = realm.object(ofType: Note.self, forPrimaryKey: id) else { return }
        
        try? realm.write({
            realm.delete(note)
        })
    }
}
