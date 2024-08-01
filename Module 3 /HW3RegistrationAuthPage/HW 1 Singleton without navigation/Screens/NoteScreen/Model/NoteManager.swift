//
//  NoteManager.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 15.06.2024.
//

import Foundation
import Firebase

class NoteManager {
    
    func createNote(text: String) {
        guard let uid = Service.shared.uid else { return }
        
        let noteData: [String: Any] = [
            "note" : text,
            "date" : Date()
        ]
        
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .collection("notes")
        .addDocument(data: noteData)}
    
    func getNote(completion: @escaping ([Note]) -> ()) {
        guard let uid = Service.shared.uid else { return }
        
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .collection("notes")
            .addSnapshotListener { snap, err in
                guard err == nil else { return }
                
                var notes: [Note] = []
                if let documents = snap?.documents {
                    documents.forEach {
                        let docId = $0.documentID
                        let timeStam = $0["date"] as? Timestamp
                        let date = timeStam?.dateValue()
                        
                        let noteText = $0["note"] as? String
                        
                        let oneNote: Note = Note(id: docId, date: date, note: noteText)
                        notes.append(oneNote)
                    }
                }
                completion(notes)
            }
    }
}


struct Note {
    let id: String
    let date: Date?
    let note: String?
}
