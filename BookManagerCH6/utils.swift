//
//  utils.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 3/5/26.
//
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
func filterFavoriteBooks(
    books: [PersistentBook], /*useFavorite:Bool = true,*/
    genre: Genre? = nil,
    readingStatus: ReadingStatus? = nil
) -> [PersistentBook] {
    return books.filter{
//        ( useFavorite == false || $0.isFavorite )
        $0.isFavorite
        && (
            genre == nil //false
            || $0.genre == genre //false
        ) //false
        && (
            readingStatus == nil
            || $0.readingStatus == readingStatus
        )
    }
}
