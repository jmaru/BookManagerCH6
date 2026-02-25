//
//  Genre.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/24/26.
//

enum Genre: String, CaseIterable {
    case classic = "Classic"
    case fantasy = "Fantasy"
    case mystery = "Mystery"
    case romance = "Romance"
    case sciFi = "Sci-Fi"
    case thriller = "Thriller"
    
    //default catch all case
    case unknown = "Unknown"
}
