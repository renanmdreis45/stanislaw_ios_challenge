//
//  stanislaw_ios_challengeApp.swift
//  stanislaw_ios_challenge
//
//  Created by Renan Martins Dantas Reis on 03/06/25.
//

import SwiftUI
import SwiftData

@main
struct stanislaw_ios_challengeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
