//
//  PruebaCeibaApp.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import SwiftUI

@main
struct PruebaCeibaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            UserScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
