//
//  FolderModel.swift
//  RealmProject2
//
//  Created by Игорь Крысин on 27.06.2024.
//

import Foundation
import RealmSwift

struct FolderModel: Identifiable {
    static var identifier = "FolderCell"
    var id: String = UUID().uuidString
    var nameText: String
    
    static func createDataForTable() -> [FolderModel] {
        [
            FolderModel(nameText: "Первый"),
            FolderModel(nameText: "Второй"),
            FolderModel(nameText: "Третий")
        ]
        
    }
}

class FolderModelRealm: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String = ""
    @Persisted var notes: List<NoteModel>
}
