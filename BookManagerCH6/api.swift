//
//  api.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/17/26.
//

import Foundation

func getBooks() -> [Book] {
    return [
        Book(
            title:"The fellowship of the Rings",
            author:"J.R.R. Tolkien",
            cover:"lotr_fellowship",
            summary:"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32. \n\n The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\n\n The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
            isFavorite: true,
        ),
        Book(
            title:"The two towers",
            author:"J.R.R. Tolkien",
            cover:"lotr_towers",
            summary: "This is the second book in the LOTR trilogy.",
            rating: 4,
            review: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia",
            isFavorite: true,
            genre: .fantasy
        ),
        Book(
            title:"The return of the King",
            author:"J.R.R. Tolkien",
            cover:"lotr_king",
            summary: "This is the third book in the LOTR trilogy."
        ),
    ]
}

func getNewBook() -> Book {
    Book(title:"", author:"", cover:"lotr_fellowship", summary: "")
}
