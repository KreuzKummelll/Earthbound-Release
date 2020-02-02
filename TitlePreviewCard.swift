//
//  TitlePreviewCard.swift
//  Earthbound Release
//
//  Created by Andrew on 09.11.19.
//  Copyright © 2019 Smalli. All rights reserved.
//

import SwiftUI

struct TitlePreviewCard: View {
    
    var title: String
    
    
    
    
    var body: some View {
        
        return VStack(alignment: .center) {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [ThemeComponenets.persianPink, ThemeComponenets.sunglow, Color(hue: Double.random(in: 0...1.0), saturation: Double.random(in: 0...1.0), brightness: Double.random(in: 0...1.0))]), startPoint: .topTrailing, endPoint: .trailing)
                
                
                
                Text(title)
                    
                    .foregroundColor(Color.init(hue: Double.random(in: 0.7...1.0), saturation: Double.random(in: 0.7...1.0), brightness: Double.random(in: 0.7...1.0)))
                    .font(.custom("American Typewriter", size: 26))
                    .italic()
                    .lineLimit(nil)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10.0)
                    
            }
            
        }
        .drawingGroup()
        .clipShape(Circle())
    }
    
}

struct TitlePreviewCard_Previews: PreviewProvider {
    static var previews: some View {
        TitlePreviewCard(title: "A Pigeon Ponders")
    }
}
