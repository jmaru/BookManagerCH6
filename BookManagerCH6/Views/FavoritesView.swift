//
//  FavoritesView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/21/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var books: [Book]
    
    //computed property
    private var favoriteBooks: [Book] {
        filterFavoriteBooks(books: books)
    }
    
    var body: some View {
        ScrollView{
            ForEach(favoriteBooks){ book in
                Text(book.title)
            }
        }
    }
}

func filterFavoriteBooks(books: [Book]) -> [Book] {
    return books.filter{
        $0.isFavorite
    }
}
