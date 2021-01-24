//
//  ContentView.swift
//  HomeEsgi
//
//  Created by Taj Singh on 30/12/2020.
//

import SwiftUI
import CocoaMQTT
import WatchConnectivity

struct ContentView: View {
        
    @State var temperature: Float = 0.0
    @State var humidity: Float = 0.0
    @State var quality: String = ""
    @State var newTemp: Int = 0
    @State var mqtt: CocoaMQTT
    
    var model = iOSConnection()
    var clientId = "f3e05549e6624e5494ba548f961f3d96"
    var host = "2.tcp.ngrok.io"
    var temp_topic = "FYC/temperature"
    var humidity_topic = "FYC/humidity"
    var quality_topic = "FYC/quality"
    
    var body: some View {
                
        ZStack {
            HomeScreen(temperature: $temperature, humidity: $humidity, quality: $quality, newTemp: $newTemp, mqtt: $mqtt)
        }.onAppear {
            mqttSetting()
            self.mqtt.didConnectAck = { mqtt, ack in
                self.mqtt.subscribe(temp_topic)
                self.mqtt.subscribe(humidity_topic)
                self.mqtt.subscribe(quality_topic)
                self.mqtt.didReceiveMessage = { mqtt, message, id in
                    if(message.topic == temp_topic){
                        print("Message received in topic \(message.topic) with payload \(message.string!)")
                        temperature = (message.string! as NSString).floatValue
                    } else if(message.topic == humidity_topic){
                        print("Message received in topic \(message.topic) with payload \(message.string!)")
                        humidity = (message.string! as NSString).floatValue
                    } else if(message.topic == quality_topic){
                        print("Message received in topic \(message.topic) with payload \(message.string!)")
                        quality = message.string!
                    }
                }
            }
        }
    }
    
    func mqttSetting() {
        mqtt = CocoaMQTT(clientID: clientId, host: host, port: 14293)
        mqtt.username = "fycMQTT"
        mqtt.password = "fycmqtt"
        mqtt.willMessage = CocoaMQTTWill(topic: "FYC/deathSwift", message: "death")
        mqtt.keepAlive = 60
        mqtt.connect()
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var temperature: Float = 0.0
    @State static var mqtt: CocoaMQTT = CocoaMQTT(clientID: "swift", host: "0.tcp.ngrok.io", port: 19510)
    @State static var newTemp: Int = 0
    @State static var model = iOSConnection()
    var newTemp: Float

    static var previews: some View {
        Group {
            ContentView(temperature: temperature, newTemp: newTemp, mqtt: mqtt)
            ContentView(temperature: temperature, newTemp: newTemp, mqtt: mqtt)
        }
    }
}

extension Color {
    static func hexColour(hexValue:UInt32)->Color
    {
        let red = Double((hexValue & 0xFF0000) >> 16) / 255.0
        let green = Double((hexValue & 0xFF00) >> 8) / 255.0
        let blue = Double(hexValue & 0xFF) / 255.0
        return Color(red:red, green:green, blue:blue)
    }
}
