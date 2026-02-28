//
//  ContentView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/12/26.
//

import SwiftUI

struct ContentView: View {

    @State var books = getBooks()
    @AppStorage(SETTINGS_THEME_KEY) private var theme: Theme = .system
    @AppStorage(SETTINGS_ACCENT_COLOR_KEY) private var accentColor: Color = .blue

    var colorScheme: ColorScheme? {
        switch theme {
        case .system:
            return nil
        case .dark:
            return .dark
        case .light:
            return .light
        }
    }
    
// Swift UI is declarative not imperative programming
    var body: some View {
        TabView{
            ListView(books: $books)
                .tabItem {
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoritesView(books:  $books)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .tint(accentColor)
        .preferredColorScheme(colorScheme)
    }

}

//#Preview {
//    ContentView()
//}
