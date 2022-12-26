//
//  PoobChatApp.swift
//  PoobChat
//
//  Created by Joshua North on 12/26/22.
//

import SwiftUI

@main
struct PoobChatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
