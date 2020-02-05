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
    var body: some View {
        NavigationView {
            
            List {
                ForEach(app.poemData, id: \.self) { poem in
                    NavigationLink(destination: PoemCellView(poem: poem)) {
                        ZStack {
                            Text("<\(poem.title)>").font(.system(size: 34, weight: .ultraLight, design: .serif))
                        }
                        
                    }
                    
                }
            }
            
            .navigationBarTitle(Text("Earthbound Release"))
            .navigationBarItems(trailing:
                Button(action: {
                withAnimation {
                    self.app.loadPoems()
                }
                
            }, label: {
                Text("Reload")
            }))
            
            
        }.padding()
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
