//
//  ContentView.swift
//  TestZstack
//
//  Created by Ahmad Qureshi on 15/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .renderingMode(.template)
                    .foregroundColor(.red)
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
