//
//  HomeView.swift
//  DeepLinkDemo
//
//  Created by Ahmad Qureshi on 13/12/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home Screen")
            NavigationLink {
                ForgotPassView(forgotPassVM: ForgotPassViewModel(token: "", id: ""))
            } label: {
                Text("Forgot password")
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(5)
            }


        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
