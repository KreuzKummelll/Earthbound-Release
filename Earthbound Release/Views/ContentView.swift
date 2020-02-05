//
//  ContentView.swift
//  Earthbound Release
//
//  Created by Andrew on 02.02.20.
//  Copyright © 2020 Smalli. All rights reserved.
//

import SwiftUI




struct ContentView: View {
    @EnvironmentObject var app: AppState
    @State private var showingOptionsScreen = false
    @State private var showingFavoritesScreen = false
    
    @FetchRequest(entity: FavoritedPoem.entity(), sortDescriptors: []) private var fetchedfavorited: FetchedResults<FavoritedPoem>
    
    var body: some View {
        NavigationView {
         
            
            List(app.poems, id: \.self) { poem in
                
                    NavigationLink(destination: PoemDetailView(poem: poem)) {
                     
                        PoemCell(poem: poem, showingOptionsScreen: self.$showingOptionsScreen)
                        .sheet(isPresented: self.$showingOptionsScreen) {
                            OptionsScreen()
                        }
                        .navigationBarTitle(Text("Earthbound Release"))
                        .navigationBarItems(trailing:
                            HStack {
                                NavigationLink(destination: FavoritesScreen(favoites: Set(self.fetchedfavorited.compactMap{ $0 })), label: {
                                    Image(systemName: "text.badge.star")
                                    
                                })
                                
                        })
                        
                    
                }
                    .onAppear(perform: self.applyCoreDataFavoritesToWorkingCopyFavorites)
            }
        }
    }
    func applyCoreDataFavoritesToWorkingCopyFavorites() {
        self.app.favorited = Set<String>(self.fetchedfavorited.compactMap{ $0.poemTitle })
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppState())
    }
}

struct OptionsScreen: View {
    var body: some View {
        VStack {
            Text("Options Screen")
        }
    }
}

struct PoemCell: View {
    var poem: Poem
    @EnvironmentObject var app: AppState
    @Binding var showingOptionsScreen : Bool
    
    var body: some View {
        
        ZStack {
            Text(poem.title)
                .font(.system(size: 34, weight: .ultraLight, design: .serif))
                .foregroundColor(self.app.favorited.contains(poem.title) ? Color.init(UIColor.turmeric) : Color.secondary)
            
        }
        
        
        
    }
}
