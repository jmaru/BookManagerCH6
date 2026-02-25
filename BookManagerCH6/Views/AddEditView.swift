//
//  AddEditView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/17/26.
//

import SwiftUI

struct AddEditView: View {
    
    @Binding var book: Book
    
    var body: some View {
        Form{
            Section(header: Text("Book details")){
                TextField("Title of the book", text: $book.title)
            }
        }
    }
}
