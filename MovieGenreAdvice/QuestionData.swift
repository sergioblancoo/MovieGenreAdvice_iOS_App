//
//  QuestionData.swift
//  MovieGenreAdvice
//
//  Created by Sergio Blanco on 30/3/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import Foundation

struct Question {
    var label: String
    var answer: [Answer]
}

struct Answer {
    var text: String
    var type: GenreType
}

enum GenreType: String {
    case comedy = "comedy", fantasy = "fantasy", crime = "crime", drama = "drama"
    
    var definition: String {
        switch self {
        case .comedy:
            return "comedy"
        case .fantasy:
            return "fantasy"
        case .crime:
            return "crime"
        case .drama:
            return "drama"
        }
    }
}
