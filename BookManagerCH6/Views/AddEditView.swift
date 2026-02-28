//
//  AddEditView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/17/26.
//

import SwiftUI

struct AddEditView: View {
    
    @Binding var book: Book
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    
    @State private var rating:Int = 0
    @State private var review = ""
    
    init(book: Binding<Book>){
        print(book.wrappedValue.title)
        self._book = book
        self._title = .init(wrappedValue:book.wrappedValue.title)
        self._author = .init(wrappedValue:book.wrappedValue.author)
        self._summary = .init(wrappedValue:book.wrappedValue.summary)
        
        self._rating = .init(wrappedValue:book.wrappedValue.rating)
        self._review = .init(wrappedValue:book.wrappedValue.review)
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Book details")){
                    TextField("Title of the book", text: $title)
                    TextField("Author", text: $author)
                    TextEditor(text: $summary)
                        .frame(height: 150)
                    Picker("Genre", selection: $book.genre){
                        ForEach(Genre.allCases, id:\.self){ genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                Section(header: Text("Review")){
//                    Picker("Rating", selection:$rating){
//                        Text("Select a rating...").tag(0)
//                        ForEach(1...5, id: \.self){
//                            Text("\($0)").tag($0)
//                        }
//                    }
                    Picker("Reading status", selection: $book.readingStatus){
                        ForEach(ReadingStatus.allCases, id:\.self){ readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)
                        }
                    }
                    StarRatingField(rating: $rating)
                    TextEditor(text: $review)
                        .frame(height: 150)
                }
            }
            .navigationTitle("\(book.title.isEmpty ? "Add" : "Edit") Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    FavoriteToggle(isFavorite: $book.isFavorite)
                }
                
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        //action
                        book.title = title
                        book.author = author
                        book.summary = summary
                        book.rating = rating
                        book.review = review
                        dismiss()
                    }.disabled(title.isEmpty)
                }
            }
        }
    }
}
