//
//  TempScreen.swift
//  HomeEsgi WatchKit Extension
//
//  Created by Taj Singh on 23/01/2021.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    
    @Binding var watchNewTemp: Int
    var screenSize = WKInterfaceDevice.current().screenBounds.width
    @ObservedObject var modelWatch = iOSConnection()
    
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                Image(systemName: "thermometer")
                    .font(.title)
                    .foregroundColor(.red)
                Text("Actual Temperature")
                Spacer()
            }
            Spacer()
            Text(self.modelWatch.temperature == "0" ? "0 °C" : "\(self.modelWatch.temperature)° C").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            Spacer()
            HStack {
                NavigationLink(destination: TempScreen(watchNewTemp: $watchNewTemp)) {
                    HStack {
                        Image(systemName: "pencil")
                        Text("Change it now")
                    }.padding(10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                    .shadow(color: .red, radius: 5)
                    .border(Color.clear, width: 2)
                }
            }
        }.onAppear {
            self.modelWatch.connect()
        }
    }
}
