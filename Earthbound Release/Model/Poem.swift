//
//  Poem.swift
//  Earthbound Release
//
//  Created by Andrew on 09.06.19.
//  Copyright © 2019 Smalli. All rights reserved.
//

import SwiftUI


struct Poem: Identifiable, Hashable, Codable {
    static func == (lhs: Poem, rhs: Poem) -> Bool {
        lhs.title == rhs.title && lhs.text == rhs.text
    }
    
    var title: String
    var text: String
    var id : Int16
    var neighbours: (Int16, Int16) {
        ((id == 0 ? 0 : (id - 1)), id + 1)
    }
}
