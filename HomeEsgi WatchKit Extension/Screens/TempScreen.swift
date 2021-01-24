//
//  TempScreen.swift
//  HomeEsgi WatchKit Extension
//
//  Created by Taj Singh on 23/01/2021.
//

import Foundation
import SwiftUI

struct TempScreen: View {
    @Binding var watchNewTemp: Int
    var screenSize = WKInterfaceDevice.current().screenBounds.width
    var model = iOSConnection()
    
    var body: some View {
        VStack{
            Text("Temperature")
                .font(.system(size: 28, weight: .semibold, design: .default))
                .padding(.bottom, 10)
            Text("\(watchNewTemp)° C").font(.title)
            HStack {
                Button(action: {
                    if(watchNewTemp != 0){
                        watchNewTemp -= 1;
                    }
                }) {
                    Image(systemName: "minus.square")
                        .font(.title)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                        )
                        .shadow(color: .red, radius: 2)
                        .border(Color.clear, width: 2)
                }
                Spacer()
                Button(action: {
                    model.send(message: ["temperature": "\(watchNewTemp)"])
                }) {
                    Image(systemName: "checkmark.square")
                        .font(.title)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                        )
                        .shadow(color: .green, radius: 2)
                        .border(Color.clear, width: 2)
                }
                Spacer()
                Button(action: {
                    if(watchNewTemp != 30){
                        watchNewTemp += 1;
                    }
                }) {
                    Image(systemName: "plus.square")
                        .font(.title)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                        )
                        .shadow(color: .red, radius: 2)
                        .border(Color.clear, width: 2)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Temperature")
    }
}
