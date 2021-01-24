//
//  HomeEsgiApp.swift
//  HomeEsgi
//
//  Created by Taj Singh on 30/12/2020.
//

import SwiftUI
import CocoaMQTT

@main
struct HomeEsgiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(newTemp: 0, mqtt: CocoaMQTT(clientID: "swift", host: "0.tcp.ngrok.io", port: 19510))
        }
    }
}
