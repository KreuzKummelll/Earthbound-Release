//
//  ShapesView.swift
//  Earthbound Release
//
//  Created by Andrew on 23.11.19.
//  Copyright © 2019 Smalli. All rights reserved.
//

import SwiftUI
import CoreMotion


struct ShapesView : View {
    
    @State private var radius: CGFloat = 10.0
    
    @State private var startRadians: Double = Double.pi
    @State private var endRadians: Double = -Double.pi
    @State private var centerX: CGFloat = 0.0
    @State private var centerY: CGFloat = 0.0
    
    @State private var automated: Bool = false
    
    
    var motion = CMMotionManager()
    
    let timer = Timer.publish(every: TimeInterval(1.0), on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        
        let r = Binding<CGFloat>(
            get: {
                self.radius
            },
            set: {
                self.radius = $0
                print("New radius value is \(self.radius)")
            }
        )
        
        if let accelerometerData = self.motion.accelerometerData {
            self.centerY = CGFloat(accelerometerData.acceleration.y) * 100.0
            
        }
        
        return VStack{
            
          
            
            GeometryReader { geometry in
                
                
                GeometryReader { geo in
                    //                CircleShape(geo: geo, radius: self.$radius, startAngleRadians: self.$startRadians, endAngleRandians: self.$endRadians)
                    CircleShape(geo: geo, radius: self.$radius, centerX: self.$centerX, centerY: self.$centerY, startAngleRadians: self.$startRadians, endAngleRandians: self.$endRadians)
                        .onReceive(self.timer) { input in
                            if self.automated {
                                self.applyNewValues(geo: geo, &self.radius, &self.startRadians, &self.endRadians, &self.centerX, &self.centerY)
                            }
                        }
                        .animation(.easeIn(duration: 1.0))
                }
                
                VStack {
                    
                    Toggle(isOn: self.$automated) {
                        Text("Automated")
                    }.padding()
                    
                    VStack{
                        Text("Radius: \(self.radius)")
                        Slider(value: r, in: 1...UIScreen.main.bounds.height)
                    }
                    VStack{
                        Text("Start: \(self.startRadians)")
                        Slider(value: self.$startRadians, in: 0.0...(2*Double.pi))
                        
                    }
                    VStack{
                        Text("End:\(self.endRadians)")
                        Slider(value: self.$endRadians, in: 0.0...(2*Double.pi))
                        
                    }
                    VStack{
                        Text("Center X:\(self.centerX)")
                        Slider(value: self.$centerX, in: 0.0...(UIScreen.main.bounds.width) / 2)
                        
                    }
                    VStack{
                        Text("Center Y:\(self.centerY)")
                        Slider(value: self.$centerY, in: 0.0...(UIScreen.main.bounds.height) / 2)
                        
                    }
                }
                
            }
        }
        
    }
    
    func applyNewValues(geo: GeometryProxy, _ radius: inout CGFloat, _ startRadians: inout Double, _ endRadians: inout Double, _ centerX:  inout CGFloat, _ centerY: inout CGFloat  ) {
        
        radius = CGFloat.random(in: 0..<CGFloat(geo.size.width))
        startRadians = Double.random(in: 0..<2 * Double.pi)
        endRadians = Double.random(in: 0..<2 * Double.pi)
        centerX = CGFloat.random(in: 0..<geo.size.width)
        centerY = CGFloat.random(in: 0..<geo.size.height)
        
        
    }
    
}


struct CircleShape: Shape {
    var geo: GeometryProxy
    @Binding var radius: CGFloat
    @Binding var centerX: CGFloat
    @Binding var centerY: CGFloat
    
    @Binding var startAngleRadians: Double
    @Binding var endAngleRandians: Double
    
    
    
    
    func path(in rect: CGRect) -> Path {
        
        
        let frame = geo.frame(in: .global)
        var path = Path()
        path.move(to: CGPoint(x: frame.midX, y: frame.midY))
        path.addArc(center: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: Angle(radians: startAngleRadians), endAngle: Angle(radians: endAngleRandians), clockwise: true)
        
        return path
    }
    
    
    
    
}
