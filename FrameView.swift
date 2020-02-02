//
//  FrameView.swift
//  Earthbound Release
//
//  Created by Andrew on 19.11.19.
//  Copyright © 2019 Smalli. All rights reserved.
//

import SwiftUI

struct FrameView : View {
    
    var frameImage : Image
    
    var body: some View {
        
        frameImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(Color.clear)
            .blendMode(.difference)
        
    }
}


struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView(frameImage: Image("RasTafari"))
    }
}

