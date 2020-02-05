//
//  PoemCD+CoreDataClass.swift
//  Earthbound Release
//
//  Created by Andrew on 25.11.19.
//  Copyright © 2019 Smalli. All rights reserved.
//
//

import Foundation
import CoreData

@objc(PoemCD)
public class PoemCD: NSManagedObject {
    
    
    
    var wrappedText: String {
        text ?? "Unknown text"
    }
    var wrappedTitle: String {
        title ?? "Unknown title"
    }
    
    
}
