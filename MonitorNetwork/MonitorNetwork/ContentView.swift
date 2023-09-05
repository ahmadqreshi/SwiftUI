//
//  ContentView.swift
//  MonitorNetwork
//
//  Created by Ahmad Qureshi on 01/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var showNetworkAlert = false
    var body: some View {
        ZStack {
            Text("Hello World")
        }
        .onChange(of: networkMonitor.isConnected) { connection in
            showNetworkAlert = connection == false
        }
        .alert(
            "Network connection seems to be offline.",
            isPresented: $showNetworkAlert
        ) {}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
