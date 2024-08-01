//
//  Tag+CoreDataClass.swift
//  HomeWorkWithCamera
//
//  Created by Игорь Крысин on 14.07.2024.
//
//

import Foundation
import CoreData

@objc(Tag)
public class Tag: NSManagedObject {

}

extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var note: Note?

}

extension Tag : Identifiable {

}
