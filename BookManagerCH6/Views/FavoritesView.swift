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
    
    //computed property
    private var favoriteBooks: [Book] {
        filterFavoriteBooks(books: books, genre: selectedGenre)
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if selectedGenre != nil {
                    Text("Filtering by genre: \(selectedGenre!.rawValue)")
                }
                if favoriteBooks.isEmpty {
                    Text("No favorite books")
                        .foregroundColor(.secondary)
                } else{
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]){
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
                    FilterOptionsView(selectedGenre: $selectedGenre)
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
func filterFavoriteBooks(books: [Book], genre: Genre?) -> [Book] {
    return books.filter{
        $0.isFavorite //true
        && (
            genre == nil //false
            || $0.genre == genre //false
        ) //false
    }
}
