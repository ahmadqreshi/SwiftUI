//
//  demoCoreDataApp.swift
//  demoCoreData
//
//  Created by Ahmad Qureshi on 22/12/22.
//

import SwiftUI

@main
struct demoCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
