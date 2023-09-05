//
//  ContentView.swift
//  ColorPicker
//
//  Created by Ahmad Qureshi on 28/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var bgColor: Color = .green
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            ColorPicker(selection: $bgColor) {
                Text("Select Any Color")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(height: 50)
            .padding(.horizontal,20)
            .background(.black)
            .cornerRadius(10)
            .padding(.horizontal,20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
