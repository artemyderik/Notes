//
//  Persistence.swift
//  Notes
//
//  Created by Артемий Дериглазов on 09.03.2024.
//

import CoreData

class DataController: ObservableObject {
    static let shared = DataController()

    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    init() {
        container = NSPersistentContainer(name: "NotesData")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func fetchData() -> [Note] {
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Note.timeStamp, ascending: false)]
        
        var notes: [Note] = []
        
        do {
            notes =  try viewContext.fetch(request)
        } catch let error {
            print("Loading error: \(error.localizedDescription)")
        }
        
        return notes
    }
    
    func addNewNote(with text: String) {
        let newNote = Note(context: viewContext)
        newNote.text = text
        newNote.timeStamp = Date()
        newNote.id = UUID()
        
        save()
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("An ERROR occurred while save: \(error.localizedDescription)")
            }
        }
    }
    
    func updateNote(_ note: Note, _ enteredText: String) {
        note.text = enteredText
        note.timeStamp = Date()
        save()
    }
}
