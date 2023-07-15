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
    
    static func createFavoriteWordItem(withWord word: String, aPartOfSpeech partOfSpeech: String, andDefinition definition: String) {
        
        let favoriteWordDetailItem = WordDetail(context: managedObjectContext)
        favoriteWordDetailItem.word = word
        favoriteWordDetailItem.partOfSpeech = partOfSpeech
        favoriteWordDetailItem.definition = definition
        
        do {
            try managedObjectContext.save()
        }
        catch {
            print("Error in storing data.")
        }
    }
    
    // MARK: Read
    
    static func fetchFavoriteWordDetails(usingWord word: String, completion: (WordDetail?) -> Void) {
       
        let fetchRequest = NSFetchRequest<WordDetail>(entityName: "WordDetail")
        fetchRequest.predicate = NSPredicate(format: "word == %@", word)
  
        do {
            let favoriteWordItem = try managedObjectContext.fetch(fetchRequest)
            completion(favoriteWordItem.first)
        }
        catch {
            print("Could not fetch due to error: \(error.localizedDescription)")
        }
        completion(nil)
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




