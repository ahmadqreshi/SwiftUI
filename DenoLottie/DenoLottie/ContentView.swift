//
//  ContentView.swift
//  DenoLottie
//
//  Created by Ahmad Qureshi on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var showNetworkError: Bool = false
    var body: some View {
        VStack {
            Button {
                showNetworkError = true
            } label: {
                Text("Show")
                    .foregroundColor(.white)
                    .padding(.all,10)
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
        .fullScreenCover(isPresented: $showNetworkError) {
            LottieView(fileName: "demoLottie", isLooping: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
