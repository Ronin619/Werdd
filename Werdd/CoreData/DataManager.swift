//
//  DataManager.swift
//  Werdd
//
//  Created by Eric Tam on 6/27/23.
//

import Foundation
import CoreData
import UIKit

class DataManager {
    static let managedObjectContext: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    
    // MARK: Create
    
    static func createFavoriteWord(withWord word: String, aPartOfSpeech partOfSpeech: String, andDefinition definition: String) {
        
        let favoriteWordDetails = WordDetail(context: managedObjectContext)
        favoriteWordDetails.word = word
        favoriteWordDetails.partOfSpeech = partOfSpeech
        favoriteWordDetails.definition = definition
        
        do {
            try managedObjectContext.save()
        }
        catch {
            print("Error in storing data.")
        }
    }
    
    // MARK: Read
    
    static func fetchFavoriteWordDetails(completion: ([WordDetail]?) -> Void) {
        do {
            let wordDetails = try managedObjectContext.fetch(WordDetail.fetchRequest())
            completion(wordDetails)
        }
        catch {
            print("Cannot Fetch!")
        }
    }
    
    // MARK: Delete
    
    static func removeFavoriteWord(word: WordDetail) {
        managedObjectContext.delete(word)
        
        do {
            try managedObjectContext.save()
        }
        catch {
            print("Error in deleting data.")
        }
    }

}




