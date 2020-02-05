//
//  FavoritesScreen.swift
//  Earthbound Release
//
//  Created by Andrew on 05.02.20.
//  Copyright © 2020 Smalli. All rights reserved.
//

import SwiftUI

struct FavoritesScreen: View {
    
    var favoites: Set<FavoritedPoem>

    
    var body: some View {
        List {
            ForEach([String](favoites.compactMap{ $0.poemTitle }).sorted(), id: \.self) { title in
                Text(title)
            }
        }
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen(favoites: .init())
    }
}
