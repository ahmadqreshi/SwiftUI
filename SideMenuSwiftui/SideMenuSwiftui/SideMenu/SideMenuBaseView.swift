//
//  ContentView.swift
//  SideMenuSwiftui
//
//  Created by Ahmad Qureshi on 29/12/22.
//

import SwiftUI
//MARK: - ContentView
struct SideMenuBaseView: View {
    @State var showMenu = false
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    showMenu = false
                }
            }
        return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                MainView(mainViewModel: MainViewModel(showMenu: $showMenu))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                if showMenu {
                    Rectangle()
                        .fill(
                            Color.black
                                .opacity(showMenu ? 0.2 : 0)
                        )
                        .ignoresSafeArea()
                        .onTapGesture {
                            showMenu = false
                        }
                }
                SideMenuView(showMenu: $showMenu)
                    .offset(x: showMenu ? 0 : -geometry.size.width/1.2)
                    .animation(.linear(duration: 0.2), value: showMenu)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuBaseView()
    }
}
