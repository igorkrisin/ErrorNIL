//
//  ModelDataBase.swift
//  RealmProject
//
//  Created by Игорь Крысин on 25.06.2024.
//

import Foundation
import RealmSwift

class NoteModel: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var date: Date = Date()
    @Persisted var header: String = ""
    @Persisted var text: String = ""
    
}
