//
//  CoreDataManager.swift
//  HomeWorkWithCamera
//
//  Created by Игорь Крысин on 14.07.2024.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    var notes: [Note] = []
        
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
        fetchNotes()
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "HomeWorkWithCamera")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
               
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createNote(name: String, image: String) {
        let note = Note(context: context)
        note.id = UUID().uuidString
        note.descripText = name
        note.image = image
        note.date = Date()
        
        saveContext()
        fetchNotes()
    }
    
    func fetchNotes() {
        let req = Note.fetchRequest()
        if let note = try? context.fetch(req) {
            self.notes = note
        }
    }
    
    func addTag(name: String, note: Note) {
        let tag = Tag(context: context)
        tag.id = UUID().uuidString
        tag.note = note
        tag.name = name
        saveContext()
        fetchNotes()
    }

}
