//
//  BookManagerCH6App.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/12/26.
//

import SwiftUI
import SwiftData

@main
struct BookManagerCH6App: App {
    let modelContainer: ModelContainer

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
    
    init(){
        do {
            modelContainer = try ModelContainer(
                for: PersistentBook.self
            )
        } catch {
            fatalError("Failed to load model container")
        }
    }
}
