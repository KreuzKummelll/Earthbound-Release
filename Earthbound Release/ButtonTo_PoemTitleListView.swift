//
//  ButtonTo_PoemTitleListView.swift
//  Earthbound Release
//
//  Created by Andrew on 19.11.19.
//  Copyright © 2019 Smalli. All rights reserved.
//

import SwiftUI

struct ButtonTo_PoemTitleListView: View {
    
    @ObservedObject var state : AppState
    @Binding var backgroundTransitioning: Bool
    
    var body: some View {
        NavigationLink(destination: PoemCellView(), label: {
            
            VStack {
                VStack(alignment: .trailing, spacing: 3) {
                    HStack {
                        text(
                            string: "Earthbound",
                            font: .custom("Cochin", size: 100),
                            color: ThemeComponenets.sunsetOrange).hueRotation(Angle(degrees: 90))
                            .blendMode(.difference)
                            .animation(.spring())
                            
                    text(
                        string: "Release",
                        font: .custom("New York", size: 24),
                        color: ThemeComponenets.persianPink)
                        .blendMode(.difference)
                }
                    .padding()
                    .background(
                    AngularGradient(
                        gradient: Gradient(colors: [Color.purple, Color.pink]),
                        center: .topLeading)
                        .opacity(backgroundTransitioning ? 0.2 : 1)
                        .animation(Animation.easeInOut(duration: 5).repeatForever())
                        .blendMode(.difference))
                        .cornerRadius(10)
                }
            }
        })
    }
}

struct ButtonTo_PoemTitleListView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTo_PoemTitleListView(state: AppState(), backgroundTransitioning: .constant(true))
    }
}
