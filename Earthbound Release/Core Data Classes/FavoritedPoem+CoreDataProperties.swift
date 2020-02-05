//
//  FavoritedPoem+CoreDataProperties.swift
//  Earthbound Release
//
//  Created by Andrew on 05.02.20.
//  Copyright © 2020 Smalli. All rights reserved.
//
//

import Foundation
import CoreData


extension FavoritedPoem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritedPoem> {
        return NSFetchRequest<FavoritedPoem>(entityName: "FavoritedPoem")
    }

    @NSManaged public var poemTitle: String?
    
    var wrappedPoemTitle: String {
        poemTitle ?? "No poem title"
    }

}
