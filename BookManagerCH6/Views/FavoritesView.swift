//
//  FavoritesView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/21/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var books: [Book]
    @State private var isFilterSheetPresented: Bool = false
    @State private var selectedGenre: Genre?
    @State private var selectedReadingStatus: ReadingStatus?
    @AppStorage(SETTINGS_GRID_COLUMNS) private var gridColumns: Int = 2
    
    //computed property
    private var favoriteBooks: [Book] {
        filterFavoriteBooks(books: books, genre: selectedGenre, readingStatus: selectedReadingStatus)
    }
    
    private var gridLayout: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: gridColumns)
    } // [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if selectedGenre != nil {
                    Text("Filtering by genre: \(selectedGenre!.rawValue)")
                }
                if selectedReadingStatus != nil {
                    Text("Filtering by status: \(selectedReadingStatus!.rawValue)")
                }
                if favoriteBooks.isEmpty {
                    Text("No favorite books")
                        .foregroundColor(.secondary)
                } else{
                    LazyVGrid(columns: gridLayout){
                        ForEach(favoriteBooks){ book in
                            SquareCardView(book:book)
                        }
                    }.padding(.horizontal)
                }
            }
            .navigationTitle("My favorite books")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: { isFilterSheetPresented.toggle() }){
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                    .accessibilityLabel("Open filter options")
                }
            }
            .sheet(isPresented: $isFilterSheetPresented) {
                    FilterOptionsView(selectedGenre: $selectedGenre, selectedReadingStatus: $selectedReadingStatus)
            }
        }
    }
}

/* [
    book1:{
        isFavorite: false,
        genre: .classic
    },
    book2:{
        isFavorite: true,
        genre: .classic
    },
    book3:{
        isFavorite: true,
        genre: .fantasy
    }
]*/

// filterfavoriteBooks // genre: .classic
func filterFavoriteBooks(books: [Book], genre: Genre?, readingStatus: ReadingStatus?) -> [Book] {
    return books.filter{
        $0.isFavorite //true
        && (
            genre == nil //false
            || $0.genre == genre //false
        ) //false
        && (
            readingStatus == nil
            || $0.readingStatus == readingStatus
        )
    }
}
