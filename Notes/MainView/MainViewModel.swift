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
    
    init() {
        notes = dataController.fetchData()
    }
    
    func deleteNote(_ note: Note) {
        dataController.viewContext.delete(note)
        dataController.save()
    }
}
