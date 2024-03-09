//
//  NotesApp.swift
//  Notes
//
//  Created by Артемий Дериглазов on 09.03.2024.
//

import SwiftUI

@main
struct NotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
