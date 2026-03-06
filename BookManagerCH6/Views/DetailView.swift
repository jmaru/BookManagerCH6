//
//  DetailView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/12/26.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    var book: PersistentBook
    @State private var showEditSheet: Bool = false
    @State private var isFavorite: Bool
    @Environment(\.modelContext) private var modelContext
    
    init(book:PersistentBook){
        self.book = book
        self.isFavorite = book.isFavorite
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                //hstack
                HStack{
                    //cover image
                    Image(uiImage:book.cover)
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
                            CustomCapsule(text: book.readingStatus.rawValue, color:.blue)
                            Spacer()
                            FavoriteToggle(isFavorite: $isFavorite)
                                .onChange(of:isFavorite){
                                    book.isFavorite = isFavorite
                                    try? modelContext.save()
                                }
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
            var _ = print(book.title)
            AddEditView(book: book)
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
