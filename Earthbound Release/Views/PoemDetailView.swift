//
//  PoemCellView.swift
//  Earthbound Release
//
//  Created by Andrew on 04.02.20.
//  Copyright © 2020 Smalli. All rights reserved.
//

import Foundation
import SwiftUI

struct PoemDetailView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: FavoritedPoem.entity(), sortDescriptors: []) private var fetchedFavorites : FetchedResults<FavoritedPoem>
    
    var favorites: Set<String> {
        Set<String>(fetchedFavorites.compactMap{ $0.wrappedPoemTitle })
    }
    
    let poem: Poem
    @State private var titleTapped: Bool = false
    @State private var favorited: Bool = false
    
    
    @State private var titleColor: Color = .primary
    @State private var errorMessage: String = ""
    @State private var errorMessageViewOpacity: Double = 1
    
    var newGenTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.titleTapped = false
        }
    }
    var errorMessageFadeTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            withAnimation {
                self.errorMessageViewOpacity = 0
            }
        }
    }
    
    let gradient = Gradient(colors: [Color(UIColor.putty), Color(UIColor.husk), Color(UIColor.bananaMania), Color(UIColor.afghanTan), Color(UIColor.rawUmber), Color(UIColor.blond), Color(UIColor.turmeric), Color(UIColor.marzipan)])
    
    var body: some View {
        ZStack {
            
            
            VStack(alignment: .center, spacing: 20){
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    HStack{
                        Text("<\(poem.title)>")
                            .foregroundColor(self.favorited ? Color.init(UIColor.turmeric) : .primary)
                            .rotation3DEffect(Angle(degrees: (self.favorited ? (Bool.random() ? 360 : -360) : 0)), axis: (x: CGFloat.random(in: 0...1), y: CGFloat.random(in: 0...1), z: CGFloat.random(in: 0...1)))
                            .onTapGesture {
                                
                                if !self.favorited { // in order to favorite it had to be not a favorite
//                                    self.favorited = true // now it's favorited
                                    withAnimation{
                                        self.saveTitleAsForFavoritePoem() //
                                    }
                                } else { // had been favorited
                                    withAnimation {
                                        self.removeTitleAsForFavoritePoem()
                                    }
                                }
                                self.titleTapped = true // each time
                                _ = self.newGenTimer // each time
                        
                        }
                        Spacer()
                    }.font(.system(size: 54, weight: .ultraLight, design: .serif))
                    
                    Text(poem.text)
                        .font(.system(size: 30, weight: .ultraLight, design: .rounded))
                        .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                        .foregroundColor(.primary)
                    
                }
                
            }
            .onAppear {
                self.highlightTitle()
            }
            
            Text(errorMessage)
            .opacity(errorMessageViewOpacity)
            .font(.system(size: 20, weight: .light, design: .monospaced))
        }
        
    }
    
    func saveTitleAsForFavoritePoem() {
        let newFavorite = FavoritedPoem(context: moc)
        newFavorite.poemTitle = self.poem.title
        
        if moc.hasChanges {
            do {
                try moc.save()
                self.favorited = true
            }
            catch {
                print(error.localizedDescription)
                titleColor = .primary
                errorMessage = "Unable to save"
                _ = errorMessageFadeTimer
            }
        }
    }
    func removeTitleAsForFavoritePoem() {
//        let poemToDelete = FavoritedPoem(context: moc)
//        poemToDelete.poemTitle = poem.title
//        moc.delete(poemToDelete)
        
        guard let poemToDelete = fetchedFavorites.first(where: { $0.poemTitle == poem.title}) else {return}
        
        moc.delete(poemToDelete)
        
        if moc.hasChanges {
            do {
                try moc.save()
                self.favorited = false
            } catch {
                print(error.localizedDescription)
                
            }
        }
    }
    
    func highlightTitle() {
        if favorites.contains(self.poem.title) {
            favorited = true
        } else {
            favorited = false
        }
    }
    
}


struct PoemCellView_Previews: PreviewProvider {
    static var previews: some View {
        PoemDetailView(poem: Poem(title: "Poem 1", text: "Text of poem", id: 1))
    }
}
