//
//  Book.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/12/26.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var cover: String
    var summary: String
    //Added 2 new properties 105-4
    var rating: Int = 0
    var review: String = ""
    
    //Add a new one 106-1
    var isFavorite: Bool = false
    
    //Add 2 new properties
    var genre: Genre = .unknown
    var readingStatus: ReadingStatus = .unknown
}
