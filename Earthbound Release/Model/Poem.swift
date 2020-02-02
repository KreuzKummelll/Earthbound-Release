//
//  Poem.swift
//  Earthbound Release
//
//  Created by Andrew on 09.06.19.
//  Copyright © 2019 Smalli. All rights reserved.
//

import SwiftUI

//class Poem : ObservableObject, Identifiable {
//    @Published var title: String = ""
//    @Published var text: String = ""
//    @Published var no: Int = 0
//    @Published var neighbours = (0,0)
//    let id = UUID()
//}


struct Poem: Identifiable {
    var title: String
    var text: String
    var id = UUID()
    var neighbours : (Int, Int)
}
