//
//  ContentView.swift
//  Slider
//
//  Created by Ahmad Qureshi on 28/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var sliderValue: Double = 1.0
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            VStack {
                let val = String(format: "%.1f", sliderValue)
                Text("Value : \(val)")
                    .foregroundColor(.white)
                    .font(.headline)
                Slider(value: $sliderValue,in: 0...10,step: 0.5) {
                    Text("Slider")
                } minimumValueLabel: {
                    Text("1")
                        .foregroundColor(.white)
                        .font(.headline)
                } maximumValueLabel: {
                    Text("5")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.horizontal,20)
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
