//
//  DetailView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/12/26.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var book: Book
    @State private var showEditSheet: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                //hstack
                HStack{
                    //cover image
                    Image(book.cover)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding()
                    //vstack
                    VStack(alignment: .leading){
                        Text(book.title)
                            .font(.headline)
                        Text("by \(book.author)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        HStack{
                            CustomCapsule(text: book.genre.rawValue, color:.red)
                            Spacer()
                            FavoriteToggle(isFavorite: $book.isFavorite)
                        }
                    }
                }
                
                Text(book.summary)
                //summary
                if(book.rating > 0 || !book.review.isEmpty){
                    VStack(alignment: .leading){
                        HStack{
                            Text("Review")
                                .font(.title2)
                                .bold()
                            Spacer()
                            //Text("\(book.rating) stars")
                            StarRatingView(rating: book.rating)
                        }
                        Text(book.review)
                    }.padding(.vertical, 10)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Edit", action:{
            showEditSheet.toggle()
        }))
        .sheet(isPresented: $showEditSheet) {
            AddEditView(book: $book)
        }
    }
}

//#Preview {
//    let book = Book(
//        title:"1456",
//        author:"1456",
//        cover:"lotr_fellowship",
//        summary:"1456"
//    )
//    DetailView(book: book)
//}
//
//#Preview {
//    let book = Book(
//        title:"really long title that might overlap or something",
//        author:"1456",
//        cover:"lotr_fellowship",
//        summary:"really long text..."
//    )
//    DetailView(book: book)
//}
