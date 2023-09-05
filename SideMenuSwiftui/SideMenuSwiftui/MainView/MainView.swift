//
//  MainView.swift
//  SideMenuSwiftui
//
//  Created by Ahmad Qureshi on 29/12/22.
//

import SwiftUI
struct MainView: View {
    @ObservedObject private var mainViewModel: MainViewModel
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
    }
    var body: some View {
        Button(action: {
            mainViewModel.showMenu.toggle()
        }) {
            Text("Show Menu")
                .foregroundColor(.white)
                .padding()
                .background(.blue)
            .cornerRadius(10)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewModel: MainViewModel(showMenu: .constant(false)))
    }
}
