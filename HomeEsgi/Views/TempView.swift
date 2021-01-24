//
//  TempView.swift
//  HomeEsgi
//
//  Created by Taj Singh on 31/12/2020.
//

import SwiftUI
import CocoaMQTT

struct TempView: View {
    @Binding var temperature: Float
    @Binding var newTemp: Int
    @Binding var mqtt: CocoaMQTT
    
    var model = iOSConnection()


    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                Image(systemName: "thermometer").foregroundColor(.white).font(.system(size: 40, weight: .heavy))
                    .font(.system(size: 20, weight: .black, design: .monospaced))
                Text(String(format: "%.2f", temperature))
                    .font(.system(size: 30, weight: .black, design: .monospaced))
            }.padding(.bottom, 100)
            Text("New Temperature,°C")
                .font(.system(size: 20, weight: .black, design: .monospaced))
            Text("\(newTemp)")
                .font(.system(size: 30, weight: .black, design: .monospaced))
                .padding(.bottom, 50)
            Button(action: {
                mqtt.publish("FYC/temperature/app", withString: "\(newTemp)")
                model.send(message: ["temperature": "4"])
//                model.send(message: ["newTemp": newTemp])
            }) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Save")
                }.padding(10.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0)
                )
                .shadow(color: .red, radius: 5)
                .border(Color.clear, width: 2)
            }
        }
    }
}
