//
//  MonitorNetworkApp.swift
//  MonitorNetwork
//
//  Created by Ahmad Qureshi on 01/02/23.
//

import SwiftUI

@main
struct MonitorNetworkApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}
