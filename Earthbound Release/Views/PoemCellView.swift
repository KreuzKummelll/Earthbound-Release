//
//  PoemCellView.swift
//  Earthbound Release
//
//  Created by Andrew on 04.02.20.
//  Copyright © 2020 Smalli. All rights reserved.
//

import Foundation
import SwiftUI

struct PoemCellView: View {
    
    let poem: Poem
    @State private var titleTapped: Bool = false
    
    var newGenTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.titleTapped = false
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            
            ScrollView(.vertical, showsIndicators: true) {
            
            HStack{
                Text("<\(poem.title)>")
                    .rotation3DEffect(Angle(degrees: (self.titleTapped ? (Bool.random() ? 360 : -360) : 0)), axis: (x: CGFloat.random(in: 0...1), y: CGFloat.random(in: 0...1), z: CGFloat.random(in: 0...1)))
                    .onTapGesture {
                        withAnimation {
                            self.titleTapped = true
                            _ = self.newGenTimer
                        }
                        
                }
                Spacer()
            }.font(.system(size: 54, weight: .ultraLight, design: .serif))
        
                Text(poem.text).font(.system(size: 30, weight: .ultraLight, design: .rounded)).frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            }
        
            
            
            
        }
        .onAppear {
            
        }
    }

}


struct PoemCellView_Previews: PreviewProvider {
    static var previews: some View {
        PoemCellView(poem: Poem(title: "Poem 1", text: "Text of poem", id: 1))
    }
}
