//
//  HomeEsgiApp.swift
//  HomeEsgi WatchKit Extension
//
//  Created by Taj Singh on 30/12/2020.
//

import SwiftUI

@main
struct HomeEsgiApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(watchNewTemp:0)
            }
        }
    }
}
