//
//  MainViewModel.swift
//  Notes
//
//  Created by Артемий Дериглазов on 11.03.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var notes: [Note]

    private let dataController = DataController.shared
    private var isFirstLaunch: Bool
    
    init() {
        notes = dataController.fetchData()
        isFirstLaunch = UserDefaultsManager.shared.isFirstLaunch
        if isFirstLaunch {
            addFirstOpenAppDefaultNote()
            isFirstLaunch.toggle()
            UserDefaultsManager.shared.isFirstLaunch = isFirstLaunch
        }
    }
    
    func deleteNote(_ note: Note) {
        dataController.viewContext.delete(note)
        dataController.save()
    }
    
    func addFirstOpenAppDefaultNote() {
        let firstNote = Note(context: dataController.viewContext)
        
        firstNote.timeStamp = Date()
        firstNote.text = "Welcome to the Note App! Here is the first note."
        firstNote.id = UUID()
        
        dataController.save()
    }
}
