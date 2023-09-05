//
//  ContentView.swift
//  FontsDemo
//
//  Created by Ahmad Qureshi on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .font(Font.custom("Montserrat-Italic", size: 16))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
