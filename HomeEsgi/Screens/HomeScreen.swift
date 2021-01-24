//
//  ContentView.swift
//  HomeEsgi
//
//  Created by Taj Singh on 30/12/2020.
//

import SwiftUI
import CocoaMQTT

struct HomeScreen: View {
    
    @Binding var temperature: Float
    @Binding var humidity: Float
    @Binding var quality: String
    @Binding var newTemp: Int
    @Binding var mqtt: CocoaMQTT
    @State var color = 0xF30C32
    
    @State var reachable = "hand.thumbsdown.fill"
    
    var model = iOSConnection()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.hexColour(hexValue: 0x1C111B)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HomeHeader()
                    Spacer()
                    Text("Connected to Apple Watch :")
                        .font(.system(size: 28, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        print("isPaired", model.session.isPaired)
                        print("isReach", model.session.isReachable)
                        if (model.session.isReachable){
                            self.reachable = "hand.thumbsup.fill"
                            color = 0x0CF333
                        }
                        else{
                            self.reachable = "hand.thumbsdown.fill"
                            color = 0xF30C32
                        }
                    }) {
                        Image(systemName: reachable)
                            .font(.title)
                            .foregroundColor(Color.hexColour(hexValue: UInt32(color)))
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        VStack {
                            HStack {
                                NavigationLink(destination: TempScreen(temperature : $temperature, newTemp: $newTemp, mqtt: $mqtt)) {
                                    Card(name: "Temperature", image: "thermometer", value: "Current : \(temperature)", newValue: "New : \(newTemp)", color: Color(.red), width: 360, height: 200)
                                }
                            }
                            .padding(0.0)
                            HStack (spacing: 10) {
                                Card(name: "Air quality", image: "wind", value: quality, color: Color(.gray), width: 180, height: 200)
                                Card(name: "Humidity", image: "drop.fill", value: "\(humidity)", color: Color(.systemBlue), width: 180, height: 200)
                            }
                        }
                    }
                    .padding(.top, 40)
                }
            }
        }.onAppear {
        }
    }
}
