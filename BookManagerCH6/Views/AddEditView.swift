//
//  AddEditView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/17/26.
//

import SwiftUI
import SwiftData

struct AddEditView: View {
    
    var book: PersistentBook?
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var title: String
    @State private var author: String
    @State private var summary: String
    
    @State private var rating: Int
    @State private var review: String
    @State private var isFavorite:Bool
    
    @State private var genre:Genre
    @State private var readingStatus:ReadingStatus
    @State private var coverData:Data?
    
    init(book: PersistentBook? = nil){
        self.book = book
        if let book{
            print(book)
            title = book.title
            author = book.author
            summary = book.summary
            rating = book.rating
            review = book.review
            isFavorite = book.isFavorite
            genre = book.genre
            readingStatus = book.readingStatus
            coverData = book.coverData
        } else {
            title = ""
            author = ""
            summary = ""
            rating = 0
            review = ""
            isFavorite = false
            genre = .unknown
            readingStatus = .unknown
        }
    }
    
    var body: some View {
        NavigationStack{
            var _ = print(title)
            Form{
                Section(header: Text("Book details")){
                    TextField("Title of the book", text: $title)
                    TextField("Author", text: $author)
                    TextEditor(text: $summary)
                        .frame(height: 150)
                    Picker("Genre", selection: $genre){
                        ForEach(Genre.allCases, id:\.self){ genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                Section(header: Text("Cover")){
                    ImageField(data: $coverData)
                }
                Section(header: Text("Review")){
//                    Picker("Rating", selection:$rating){
//                        Text("Select a rating...").tag(0)
//                        ForEach(1...5, id: \.self){
//                            Text("\($0)").tag($0)
//                        }
//                    }
                    Picker("Reading status", selection: $readingStatus){
                        ForEach(ReadingStatus.allCases, id:\.self){ readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)
                        }
                    }
                    StarRatingField(rating: $rating)
                    TextEditor(text: $review)
                        .frame(height: 150)
                }
            }
            .navigationTitle("\(book == nil ? "Add" : "Edit") Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .primaryAction){
                    FavoriteToggle(isFavorite: $isFavorite)
                }
                
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        let isNewBook = book == nil
                        let bookToSave = book ?? PersistentBook(title:title.uppercased())
                        //action
                        bookToSave.title = title
                        bookToSave.author = author
                        bookToSave.summary = summary
                        bookToSave.rating = rating
                        bookToSave.review = review
                        bookToSave.isFavorite = isFavorite
                        bookToSave.readingStatus = readingStatus
                        bookToSave.genre = genre
                        if(coverData != nil){
                            bookToSave.coverData = coverData
                        }
                        print(bookToSave)
                        if isNewBook{
                            modelContext.insert(bookToSave)
                        }
                        
                        do {
                            try modelContext.save()
                        } catch {
                            print("Failed to save the book: \(error)")
                        }
                        dismiss()
                    }.disabled(title.isEmpty)
                }
            }
        }
    }
}
