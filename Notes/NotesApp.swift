//
//  NotesApp.swift
//  Notes
//
//  Created by Артемий Дериглазов on 09.03.2024.
//

import SwiftUI

@main
struct NotesApp: App {
    let dataController = DataController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.viewContext)
        }
    }
}
