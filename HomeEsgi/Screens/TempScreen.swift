//
//  ContentView.swift
//  HomeEsgi
//
//  Created by Taj Singh on 30/12/2020.
//

import SwiftUI
import CocoaMQTT

struct TempScreen: View {
    @Binding var temperature: Float
    @Binding var newTemp: Int
    @Binding var mqtt: CocoaMQTT
    
    var screenSize = UIScreen.screens.first?.bounds.width

    var body: some View {
            ZStack{
                Rectangle()
                    .foregroundColor(Color.hexColour(hexValue: 0x1C111B))
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                CircleView(newTemp: $newTemp)
                HStack{
                    VStack {
                        TempView(temperature: $temperature, newTemp: $newTemp, mqtt: $mqtt)
                            .foregroundColor(.white)
                            .padding(.leading, 30)
                    }
                    Spacer()
                }
                .padding(.top, 44)
                .padding(.bottom, 50)
                .frame(width: screenSize, height: screenSize)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Temperature")
    }
}
