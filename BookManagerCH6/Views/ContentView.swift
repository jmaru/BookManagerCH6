//
//  ContentView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/12/26.
//

import SwiftUI

struct ContentView: View {

    @State var books = getBooks()

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
        }
    }

}

//#Preview {
//    ContentView()
//}
