//
//  WordBank.swift
//  Werdd
//
//  Created by Eric Tam on 4/25/23.
//

import Foundation

    let wordArr = [
        WordAndDef(word: "Recursion", speech: "noun", definition: "Recursion is when a function calls itself repeatedly until a base case is met.", synonyms: ["n/a"], antonyms: ["n/a"], examples: ["n/a"]),
        WordAndDef(word: "FlexBox", speech: "noun", definition: "A CSS layout that organizes components within a container. It fills up all available space by adjusting the width and height of all components within.", synonyms: ["n/a"], antonyms: ["n/a"], examples: ["n/a"]),
        WordAndDef(word: "Hoisting", speech: "noun", definition: "In javascript, hoisting is when a variable or function that’s been declared and not initialized is “moved” up to the top of its scope. This allows developers to call functions or utilize variables before they appear in the code.", synonyms: nil, antonyms: ["n/a"], examples: ["n/a"]),
        WordAndDef(word: "Currying", speech: "noun", definition: "Transform a function with multiple arguments into a series of nested function that take a single argument.", synonyms: ["n/a"], antonyms: nil, examples: ["n/a"]),
        WordAndDef(word: "Memoization", speech: "noun", definition: "Data is ran once and the result is stored so it can be accessed again later to avoid redundancy.", synonyms: ["n/a"], antonyms: ["n/a"], examples: ["n/a"]),
        WordAndDef(word: "DOM", speech: "noun", definition: "Document Object Model is a data structure that defines the way a document is accessed and manipulated.", synonyms: ["n/a"], antonyms: ["n/a"], examples: ["n/a"]),
        WordAndDef(word: "Closure", speech: "noun", definition: "Is a form of lexical scoping where an inner function preserves data (usually variables) from the outer function even after an outer functions return statement has ran.", synonyms: ["n/a"], antonyms: ["n/a"], examples: ["n/a"]),
        WordAndDef(word: "OOP", speech: "noun", definition: "A programming model that organizes data in objects. Data is organized in objects for reusability and programs more efficient and easier to understand.", synonyms: ["n/a"], antonyms: ["n/a"], examples: ["n/a"]),
        WordAndDef(word: "Stacks", speech: "noun", definition: "linear data structure in which elements can be inserted and deleted only from one side of the list, called the top. The last element inserted is the first one to be removed.", synonyms: ["n/a"], antonyms: ["n/a"], examples: ["n/a"]),
        WordAndDef(word: "Queues", speech: "noun", definition: "linear data structure in which elements can be inserted only from one side of the list called rear, and the elements can be deleted only from the other side called the front.", synonyms: ["n/a"], antonyms: nil, examples: ["n/a"]),
    ]

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

