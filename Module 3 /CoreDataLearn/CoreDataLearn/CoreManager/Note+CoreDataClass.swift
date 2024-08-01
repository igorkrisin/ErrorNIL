//
//  Note+CoreDataClass.swift
//  CoreDataLearn
//
//  Created by Игорь Крысин on 08.07.2024.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {

}

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: String?
    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var isActive: Bool

}

extension Note : Identifiable {
    
    func updateNote(newText: String) {
        self.text = newText
        self.date = Date()
        try? managedObjectContext?.save()
    }
    
    func deleteNote() {
        
    }

}
