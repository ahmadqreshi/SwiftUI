//
//  ContentView.swift
//  DeepLinkDemo
//
//  Created by Ahmad Qureshi on 12/12/22.
//

import SwiftUI

struct ForgotPassView: View {
    @ObservedObject private var forgotPassVM: ForgotPassViewModel
    init(forgotPassVM: ForgotPassViewModel) {
        self.forgotPassVM = forgotPassVM
    }
    var body: some View {
        VStack(spacing: 50) {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 200,height: 200)
                .foregroundColor(.accentColor)
                
            HStack {
                Text("Hello, world!")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Spacer()
            }
            .padding(.horizontal,16)
            Button {
                forgotPassVM.printValues()
            } label: {
                Text("Press me")
                    .foregroundColor(.white)
                    .padding()
                    .background( .blue )
                    .cornerRadius(5)
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassView(forgotPassVM: ForgotPassViewModel(token: "", id: ""))
    }
}
