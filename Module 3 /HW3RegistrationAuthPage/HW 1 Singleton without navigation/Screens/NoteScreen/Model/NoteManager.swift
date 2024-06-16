//
//  NoteManager.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 15.06.2024.
//

import Foundation
import Firebase


func createNote(text: String) {
    guard let uid = Service.shared.uid else { return }
    
    let noteData: [String: Any] = [
        "note" : text,
        "date" : Data()
    ]
    
    Firestore.firestore()
        .collection("users")
        .document(uid)
        .collection("notes")
        .addDocument(data: noteData)}

func getNote() {
    
}
