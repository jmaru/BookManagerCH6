//
//  PersistentBook.test.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 3/3/26.
//

import Testing //Swift Testing
@testable import BookManagerCH6
import Foundation

@MainActor @Suite("PersistentBook Model Tests")
struct PersistentBookTests {
    
    @Test("PersistentBook initialization with just title")
    func persistentBookInit(){
        // Arrange
        let title = "Test Book"
        
        // Act
        let book = PersistentBook(title: title)
        
        // Assertion
        #expect(book.title == title)
        #expect(book.author == "")
        #expect(book.coverData == nil)
        #expect(book.summary == "")
        #expect(book.rating == 0)
        #expect(book.review == "")
        #expect(book.isFavorite == false)
        #expect(book.genre == .unknown)
        #expect(book.readingStatus == .unknown)
    }
    
    @Test("PersistentBook initialization with all data set")
    func persistentBookInitAllData(){
        // Arrange
        let title = "Test Book"
        let author = "Author Name"
        let coverData: Data? = Data((0..<1024).description.utf8)
        let summary = "A short summary of the book"
        let rating: Int = 4
        let review = "A review of the book"
        let isFavorite: Bool = true
        let genre: Genre = .fantasy
        let readingStatus: ReadingStatus = .finished
        
        // Act
        let book = PersistentBook(
            title: title,
            author: author,
            coverData: coverData,
            summary: summary,
            rating: rating,
            review: review,
            isFavorite: isFavorite,
            genre: genre,
            readingStatus: readingStatus
        )
        
        // Assertion
        #expect(book.title == title)
        #expect(book.author == author)
        #expect(book.coverData == coverData)
        #expect(book.summary == summary)
        #expect(book.rating == rating)
        #expect(book.review == review)
        #expect(book.isFavorite == isFavorite)
        #expect(book.genre == genre)
        #expect(book.readingStatus == readingStatus)
        
        let book2 = PersistentBook(book)
        
        // Assertion
        #expect(book2.title == title)
        #expect(book2.author == author)
        #expect(book2.coverData == coverData)
        #expect(book2.summary == summary)
        #expect(book2.rating == rating)
        #expect(book2.review == review)
        #expect(book2.isFavorite == isFavorite)
        #expect(book2.genre == genre)
        #expect(book2.readingStatus == readingStatus)
    }
}
