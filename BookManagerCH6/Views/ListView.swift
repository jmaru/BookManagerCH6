//
//  ListView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/24/26.
//

import SwiftUI

struct ListView: View {
    
    @Binding var books: [Book]
    
    @State private var showAddSheet = false
    @State private var newBook = getNewBook()
    
    var body: some View {
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
        }
    }
}
