//
//  WordBank.swift
//  Werdd
//
//  Created by Eric Tam on 4/25/23.
//

import Foundation

struct RandomWord: Decodable {
    var word: String
    var results: [results]?
}

struct results: Decodable {
    var definition: String
    var partOfSpeech: String
    var synonyms: [String]?
    var examples: [String]?
    var antonyms: [String]?
}

