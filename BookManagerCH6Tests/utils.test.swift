//
//  utils.test.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 3/5/26.
//

import Testing
@testable import BookManagerCH6

@MainActor @Suite("Test utils")
struct UtilsTests {
    
    // Test cases for filterFavoriteBook
    // [X] Test if filter favorites
    // [X] Test filter by genre
    // [ ] Test filter by reading status
    // [X] Test filter with no results
    // [ ] Test by all of them
    
    @Test("Test filterFavoriteBooks filter favorite books")
    func testFilterFavoriteBooks(){
        // Arrange
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3"),
        ]
        
        // Act
        let filteredBooks = filterFavoriteBooks(books: books)
        
        // Assertion
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks.first?.title == "Book 2")
    }
    
    @Test("Test filterFavoriteBooks filter favorite books by genre")
    func testFilterFavoriteBooksByGenre(){
        // Arrange
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3", genre: .classic),
            PersistentBook(title:"Book 4", isFavorite: true, genre: .classic)
        ]
        
        // Act
        let filteredBooks = filterFavoriteBooks(books: books, genre: .classic)
        
        // Assertion
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks.first?.title == "Book 4")
    }
    
    @Test("Test filterFavoriteBooks filter favorite books by reading status")
    func testFilterFavoriteBooksByReadingStatus(){
        // Arrange
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3", readingStatus: .planToRead),
            PersistentBook(title:"Book 4", isFavorite: true, readingStatus: .planToRead),
            PersistentBook(title:"Book 5", isFavorite: true, readingStatus: .dropped)
        ]
        
        // Act
        let filteredBooks = filterFavoriteBooks(books: books, readingStatus: .planToRead)
        
        // Assertion
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks.first?.title == "Book 4")
    }
    
    @Test("Test filterFavoriteBooks filter favorite books none")
    func testFilterFavoriteBooksNone(){
        // Arrange
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3", genre: .classic),
            PersistentBook(title:"Book 4", isFavorite: true, genre: .classic)
        ]
        
        // Act
        let filteredBooks = filterFavoriteBooks(books: books, genre: .mystery)
        
        // Assertion
        #expect(filteredBooks.count == 0)
    }
    
    // Assignment: it filters isFavorite, genre and reading status
    
}
