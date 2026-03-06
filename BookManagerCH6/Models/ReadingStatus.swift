//
//  ReadingStatus.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/24/26.
//

enum ReadingStatus: String, CaseIterable, Hashable, Codable {
    case planToRead = "Plan to read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    
    case unknown = "Unknown"
}
