//
//  ListItemView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/17/26.
//

import SwiftUI

struct ListItemView: View {
    let book: Book
    
    var body: some View {
        HStack{
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading){//LTR vs RTL
                Text(book.title.capitalized(with: .current))
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text(book.author)
            }
        }
    }
}
