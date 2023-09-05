//
//  ContentView.swift
//  NavigationFromList
//
//  Created by Ahmad Qureshi on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<12) {item in
                Text("Hello, World")
                    .padding(.vertical,5)
            }
            .navigationTitle("Testing")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
