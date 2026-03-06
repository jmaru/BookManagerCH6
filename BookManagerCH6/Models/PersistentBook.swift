//
//  PersistentBook.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/28/26.
//

import Foundation
import SwiftData
import UIKit

@Model
class PersistentBook {
    var title: String
    var author: String
    var coverData: Data?
    var summary: String
    //Added 2 new properties 105-4
    var rating: Int
    var review: String
    
    //Add a new one 106-1
    var isFavorite: Bool
    
    //Add 2 new properties
    var genre: Genre
    var readingStatus: ReadingStatus
    
    init(
        title: String,
        author: String = "",
        coverData: Data? = nil,
        summary: String = "",
        rating: Int = 0,
        review: String = "",
        isFavorite: Bool = false,
        genre: Genre = .unknown,
        readingStatus: ReadingStatus = .unknown,
    ){
        self.title = title
        self.author = author
        self.coverData = coverData
        self.summary = summary
        self.rating = rating
        self.review = review
        self.isFavorite = isFavorite
        self.genre = genre
        self.readingStatus = readingStatus
    }
    
    //computed property
    var cover: UIImage {
        if self.coverData != nil {
            return UIImage(data: self.coverData!)!
        } else{
            return UIImage(resource: .bookIcon)
        }
    }
}
