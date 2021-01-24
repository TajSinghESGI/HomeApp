//
//  ContentView.swift
//  HomeEsgi
//
//  Created by Taj Singh on 30/12/2020.
//

import SwiftUI
struct ContentView: View {
    var modelWatch = iOSConnection()
    var screenSize = WKInterfaceDevice.current().screenBounds.width
    @State var watchNewTemp: Int

    var body: some View {
        HomeScreen(watchNewTemp: $watchNewTemp)
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var watchNewTemp: Int = 0
    static var previews: some View {
        Group {
            ContentView(watchNewTemp: watchNewTemp)
            ContentView(watchNewTemp: watchNewTemp)
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
