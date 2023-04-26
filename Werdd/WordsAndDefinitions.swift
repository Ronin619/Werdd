//
//  WordsAndDefinitions.swift
//  Werdd
//
//  Created by Eric Tam on 4/25/23.
//

import Foundation

class WordsAndDefinitions {
    let content = [
        Words(word: "Recursion", definition: "Recursion is when a function calls itself repeatedly until a base case is met."),
        Words(word: "FlexBox", definition: "A CSS layout that organizes components within a container. It fills up all available space by adjusting the width and height of all components within."),
        Words(word: "Hoisting", definition: "In javascript, hoisting is when a variable or function that’s been declared and not initialized is “moved” up to the top of its scope. This allows developers to call functions or utilize variables before they appear in the code."),
        Words(word: "Currying", definition: "Transform a function with multiple arguments into a series of nested function that take a single argument."),
        Words(word: "Memoization", definition: "Data is ran once and the result is stored so it can be accessed again later to avoid redundancy."),
        Words(word: "DOM", definition: "Document Object Model is a data structure that defines the way a document is accessed and manipulated."),
        Words(word: "Closure", definition: "Is a form of lexical scoping where an inner function preserves data (usually variables) from the outer function even after an outer functions return statement has ran."),
        Words(word: "OOP", definition: "A programming model that organizes data in objects. Data is organized in objects for reusability and programs more efficient and easier to understand."),
        Words(word: "Stacks", definition: "linear data structure in which elements can be inserted and deleted only from one side of the list, called the top. The last element inserted is the first one to be removed."),
        Words(word: "Queues", definition: "linear data structure in which elements can be inserted only from one side of the list called rear, and the elements can be deleted only from the other side called the front.")
    ]
}

protocol WordAndDefinitionsDetails {
    var word: String { get set }
    var definition: String { get set }
}
            
class Words: WordAndDefinitionsDetails {
    var word: String
    var definition: String
    
    init(word: String, definition: String) {
        self.word = word
        self.definition = definition
    }
}
