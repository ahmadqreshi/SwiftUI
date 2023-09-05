//
//  ContentView.swift
//  Toggle
//
//  Created by Ahmad Qureshi on 28/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isToggle: Bool = false
    @State private var chooseValue: String = "1"
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            VStack {
                let status = isToggle ? "Online" : "Offline"
                Text("Status: \(status)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Toggle(isOn: $isToggle) {
                    Text("Set your Status")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.horizontal,20)
                .toggleStyle(SwitchToggleStyle(tint: .green))
                Picker(selection: $chooseValue) {
                    Text("1").tag("1")
                    Text("2").tag("2")
                    Text("3").tag("3")
                    Text("4").tag("4")
                    
                } label: {
                    Text("hello")
                }
                .pickerStyle(.wheel)
                .background(.white)
                .padding(.horizontal,20)
                Button {
                    debugPrint(chooseValue)
                } label: {
                    Text("Press me")
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }

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
