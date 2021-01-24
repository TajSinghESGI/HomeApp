//
//  CircleView.swift
//  HomeEsgi
//
//  Created by Taj Singh on 31/12/2020.
//

import SwiftUI

struct CircleView: View {
    
    @Binding var newTemp: Int
    @State var rotate: CGFloat = 0.0
    @State var dragValue: CGFloat = 0.0
    
    private func changeValue(height: CGFloat) {
        let tempValue = dragValue
        dragValue = height
        rotate = height/5 * (-1)
        let diff = tempValue - dragValue
        if(newTemp >= 0 && newTemp <= 30){
            print(newTemp)
            newTemp = Int(Float(CGFloat(newTemp) + diff/2))
        } else {
            newTemp = 0
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 16, lineCap: .butt, dash: [2, 4]))
                .scaleEffect(1.10)
            Circle()
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 24, lineCap: .butt, dash: [2, 40]))
                .scaleEffect(1.05)
                
            Circle()
                .stroke(Color.red, lineWidth: 2)
//                .overlay(
//                    Circle()
//                        .stroke(Color.red, lineWidth: 5)
//                        .scaleEffect(1.12)
//                        .blur(radius: 50)
//                        .padding(.top, 50)
//                )
                .scaleEffect(1.17)

        }
        .padding(.horizontal, 50)
        .rotationEffect(.degrees(Double(rotate)))
        .frame(width: 580, height: 580)
        .offset(x: 360)
        .gesture(DragGesture(minimumDistance: 5)
                    .onChanged({ value in
                        changeValue(height: value.translation.height)
                    })
                    .onEnded({ _ in
                        rotate = 0.0
                        dragValue = 0.0
                    })
        )
    }
}
