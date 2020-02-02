//
//  PoemCellView.swift
//  Earthbound Release
//
//  Created by Andrew on 09.06.19.
//  Copyright © 2019 Smalli. All rights reserved.
//

import SwiftUI

struct PoemCellView : View {
    
//    @ObservedObject var state: AppState
    @FetchRequest(entity: PoemCD.entity(), sortDescriptors: []) var poems: FetchedResults<PoemCD>

    
    @State private var showPoemDetail = false
    
    var body: some View {
        
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<self.poems.count) { index in
                    VStack {
                        GeometryReader { geo in
                            
                            TitlePreviewCard(title: self.poems[index].title ?? "Untitled")
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.green]), startPoint: .bottomTrailing, endPoint: .top))
                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
                        }
                    }
                    .onTapGesture {
                       
                        self.showPoemDetail.toggle()
                    }
                    .frame(width: 400)
                    .sheet(isPresented: self.$showPoemDetail) {
                        PoemDetail(poem: self.poems[index])
                    }
                }
                .padding()
                
            }
            .background(Color.black)
        }
        
    }
    
}


struct PoemCellView_Previews : PreviewProvider {
    static var previews: some View {
        PoemCellView()
    }
}


