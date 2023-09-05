//
//  ContentView.swift
//  NetworkAlert
//
//  Created by Ahmad Qureshi on 08/04/23.
//
import SwiftUI
import Network

struct ContentView: View {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    
    @State var showView: Bool = false
    var body: some View {
        VStack {
            Text("Hello, world!")
        }
        .monitorNetwork
        .background {
            Text("No internet Connection Available")
                .opacity(showView ? 1 : 0)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
