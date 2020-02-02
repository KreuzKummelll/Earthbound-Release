//
//  PoemCD+CoreDataProperties.swift
//  Earthbound Release
//
//  Created by Andrew on 25.11.19.
//  Copyright © 2019 Smalli. All rights reserved.
//
//

import Foundation
import CoreData


extension PoemCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PoemCD> {
        return NSFetchRequest<PoemCD>(entityName: "PoemCD")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String?
    @NSManaged public var title: String?

    
  
}
