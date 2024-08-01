//
//  Note+CoreDataClass.swift
//  HomeWorkWithCamera
//
//  Created by Игорь Крысин on 14.07.2024.
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

    @NSManaged public var image: String?
    @NSManaged public var descripText: String?
    @NSManaged public var id: String?
    @NSManaged public var tag: NSSet?
    @NSManaged public var date: Date?

}

// MARK: Generated accessors for tag
extension Note {

    @objc(addTagObject:)
    @NSManaged public func addToTag(_ value: Tag)

    @objc(removeTagObject:)
    @NSManaged public func removeFromTag(_ value: Tag)

    @objc(addTag:)
    @NSManaged public func addToTag(_ values: NSSet)

    @objc(removeTag:)
    @NSManaged public func removeFromTag(_ values: NSSet)

}

extension Note : Identifiable {
    func deleteNote(){
        managedObjectContext?.delete(self)
        
        try? managedObjectContext?.save()
    }
}
