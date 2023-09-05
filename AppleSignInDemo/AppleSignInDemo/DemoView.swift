//
//  ContentView.swift
//  AppleSignInDemo
//
//  Created by Ahmad Qureshi on 27/02/23.
//

import SwiftUI


struct DemoView: View {
    @ObservedObject var demoVM = DemoViewModel()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                SignInWithAppleButtonUIKit()
                    .frame(width: 280, height: 60, alignment: .center)
                    .onTapGesture {
                        demoVM.showAppleLoginView()
                    }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
