//
//  ContentView.swift
//  LACustomTextField
//
//  Created by Ahmad Qureshi on 27/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var text2: String = ""
    var body: some View {
        VStack {
            CustomSecureField("Enter Email", text: $text, wrongInput: .constant(false))
            CustomSecureField("Enter Email", text: $text2, wrongInput: .constant(false))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
