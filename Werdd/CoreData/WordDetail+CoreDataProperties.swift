//
//  WordDetail+CoreDataProperties.swift
//  Werdd
//
//  Created by Eric Tam on 6/26/23.
//
//

import Foundation
import CoreData


extension WordDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordDetail> {
        return NSFetchRequest<WordDetail>(entityName: "WordDetail")
    }

    @NSManaged public var word: String?
    @NSManaged public var partOfSpeech: String?
    @NSManaged public var definition: String?

}

extension WordDetail : Identifiable {

}
