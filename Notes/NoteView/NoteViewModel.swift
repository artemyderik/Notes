//
//  NoteViewModel.swift
//  Notes
//
//  Created by Артемий Дериглазов on 11.03.2024.
//

import Foundation
import CoreData

class NoteViewModel: ObservableObject {
    @Published var enteredText: String
    
    var isNewNote: Bool
    var timeStamp: Date
    var editingNote: Note?
    
    init(enteredText: String, isNewNote: Bool, timeStamp: Date, editingNote: Note?) {
        self.enteredText = enteredText
        self.isNewNote = isNewNote
        self.timeStamp = timeStamp
        self.editingNote = editingNote
    }
    
    func saveNote() {
        if isNewNote {
            guard !isEnteredTextEmpty() else { return }
            
            DataController.shared.addNewNote(with: enteredText)
        } else {
            guard let editingNote = editingNote, !isEnteredTextEmpty() else { return }
            
            DataController.shared.updateNote(editingNote, enteredText)
        }
    }
    
    func isEnteredTextEmpty() -> Bool {
        enteredText.trimmingCharacters(in: .whitespaces) == ""
    }
}
