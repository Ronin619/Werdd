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
    var managedObjectContext: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    
    // MARK: Create
    
    func createFavoriteWordItem(withWord word: String, aPartOfSpeech partOfSpeech: String, andDefinition definition: String) {
        
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
    
        func fetchFavoriteWordDetails(usingWord word: String, completion: (WordDetail?) -> Void) {
       
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
    
        func fetchAllFavoriteWords(completion: ([WordDetail]?) -> Void) {
        do {
            let favoriteWordsDetails = try managedObjectContext.fetch(WordDetail.fetchRequest())
            completion(favoriteWordsDetails)
        } catch {
            completion(nil)
        }
    }
    
    // MARK: Delete
    
    func deleteFavoriteWord(_ favoriteWord: WordDetail) throws {
        managedObjectContext.delete(favoriteWord)
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Unable to delete favorite word.")
        }
    }

}




