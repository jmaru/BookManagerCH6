//
//  ContentView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/12/26.
//

import SwiftUI

struct ContentView: View {

    @State var books = getBooks()
    @State private var showAddSheet = false
    @State private var newBook = getNewBook()

// Swift UI is declarative not imperative programming
    var body: some View {
        TabView{
            NavigationStack{
                List($books, id:\.self.id){ $book in
                    NavigationLink(destination: DetailView(book: $book)){
                        ListItemView(book: book)
                    }
                }
                .navigationTitle("Book Manager")
                .navigationBarItems(trailing: Button("Add", action:{
                    showAddSheet.toggle()
                }))
                .sheet(isPresented: $showAddSheet){
                    // onDismiss
                    if(!newBook.title.isEmpty){
                        books.append(newBook)
                    }
                    newBook = getNewBook()
                }content:{
                    AddEditView(book: $newBook)
                }
            }.tabItem {
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
