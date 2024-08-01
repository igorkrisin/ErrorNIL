//
//  RealmManager.swift
//  RealmProject2
//
//  Created by Игорь Крысин on 06.07.2024.
//

import Foundation
import RealmSwift

class RealmManager {
    var folder: [FolderModelRealm] = []
    var realm = try! Realm()
    
    init() {
        getFolders()
    }
    //create folder
    
    func createFolder(name: String) {
        let folder = FolderModelRealm()
        folder.name = name
        //print("name: ", name)
        try? realm.write({
            realm.add(folder)
        })
        getFolders()
    }
    
    //get folder
    func getFolders() {
        let folders = realm.objects(FolderModelRealm.self)
        self.folder = Array(folders)
        //print("folders: ", folders)
    }
    
    //delete folder
    
    func deleteFolder(folderId: String) {
        if let folder = realm.object(ofType: FolderModelRealm.self, forPrimaryKey: folderId) {
            
            folder.notes.forEach { note in
                try? realm.write({
                    realm.delete(note)
                })
            }
            
            try? realm.write({
                realm.delete(folder)
            })
        }
        getFolders()
    }
        //create note
    
    func createNote(folderId: String?, note: NoteModel) {
        guard let id = folderId else { return }
        
        if let folder = realm.object(ofType: FolderModelRealm.self, forPrimaryKey: id) {
            try? realm.write({
                folder.notes.append(note)
            })
        }
        getFolders()
    }
    
    
    
        
}
