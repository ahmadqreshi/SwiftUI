//
//  ContentView.swift
//  RecaptchaDemo2
//
//  Created by Ahmad Qureshi on 22/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        
        Button {
            viewModel.execute()
        } label: {
            Text("Execute")
        }.padding()
        
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
