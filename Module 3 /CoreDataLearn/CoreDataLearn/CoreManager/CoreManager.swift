//
//  CoreManager.swift
//  CoreDataLearn
//
//  Created by Игорь Крысин on 08.07.2024.
//

import Foundation
import CoreData

class CoreManager {
    // MARK: - Core Data stack
    
    static let shared = CoreManager()
    var notes = [Note]()
    private init () {
        readNotes()
    }

    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "CoreDataLearn")
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
    
    //Create
    
    func createNote(text: String) {
        let note = Note(context: persistentContainer.viewContext)
        note.id = UUID().uuidString
        note.date = Date()
        note.text = text
        note.isActive = true
        saveContext()
    }
    
    func readNotes() {
        let req = Note.fetchRequest()
        
        let notes = try? persistentContainer.viewContext.fetch(req)
        
        guard let notesOpt = notes else {
            return
        }
        self.notes = notesOpt
       
    }
    
    func updateNote(id: String, text: String) {
        let req = Note.fetchRequest()
        req.predicate = NSPredicate(format: "id==%@", id)
        
        let note = try? persistentContainer.viewContext.fetch(req).first
        
        note?.date = Date()
        note?.text = text
        
        saveContext()
    }
    
    
    func deleteNote(id: String) {
        let req = Note.fetchRequest()
        req.predicate = NSPredicate(format: "id==%@", id)
        
        if let note = try? persistentContainer.viewContext.fetch(req).first {
            persistentContainer.viewContext.delete(note)
        }
        
        saveContext()
       
    }
    
}


















