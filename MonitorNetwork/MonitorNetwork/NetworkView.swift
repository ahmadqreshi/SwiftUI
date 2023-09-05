//
//  NetworkView.swift
//  MonitorNetwork
//
//  Created by Ahmad Qureshi on 01/02/23.
//

import SwiftUI
public struct NetworkInterceptorView<Content> : View where Content : View {
    @ViewBuilder var content: () -> Content
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var showNetworkAlert = false
    public var body: some View {
        content()
            .onChange(of: networkMonitor.isConnected) { connection in
                showNetworkAlert = connection == false
            }
            .alert(
                "Network connection seems to be offline.",
                isPresented: $showNetworkAlert
            ) {}
    }
}
