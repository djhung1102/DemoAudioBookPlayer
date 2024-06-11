//
//  DemoAudioBookPlayerApp.swift
//  DemoAudioBookPlayer
//
//  Created by Nguyễn Mạnh Hùng on 10/6/24.
//

import SwiftUI
import SwiftData
import AudioBookPlayer

@main
struct DemoAudioBookPlayerApp: App {
    
    var sharedModelContainer: ModelContainer = {
            let schema = Schema([
                LibraryBook.self
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
        .environment(AudioBookPlayerManager(modelContext: sharedModelContainer.mainContext))
    }
}
