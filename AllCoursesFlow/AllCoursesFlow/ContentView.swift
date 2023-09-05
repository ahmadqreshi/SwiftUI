//
//  ContentView.swift
//  AllCoursesFlow
//
//  Created by Ahmad Qureshi on 14/12/22.
//

import SwiftUI


struct ContentView: View {
    @State var showMenu: Bool = false
    @State var selectedCell: SelectedCell = .home
    @State private var xOffset: CGFloat = .zero
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                ZStack {
                    VStack {
                        HStack {
                            sideMenuButton
                            Spacer()
                        }
                        .padding(.all,16)
                        Spacer()
                    }
                    .overlay(
                        Rectangle()
                            .fill(
                                Color.black
                                    .opacity(showMenu ? 0.1 : 0)
                            )
                            .ignoresSafeArea()
                            .onTapGesture {
                                showMenu = false
                            }
                    )
                }
                .gesture(DragGesture()
                    .onChanged { val in
                        if val.translation.width < 0 {
                            self.xOffset = val.translation.width
                        }
                        debugPrint(self.xOffset)
                    }
                    .onEnded { val in
                        if val.translation.width < -100.0 {
                            self.showMenu = false
                            self.xOffset = 0.0
                        } else {
                            self.xOffset = .zero
                        }

                    }
                )
                SideMenuView(showMenu: $showMenu)
                    .frame(width: 300, alignment: .leading)
                    .background(Color.white)
                    .offset(x: self.showMenu ? xOffset : -geometry.size.width)
                    .animation(.linear(duration: 0.2), value: showMenu)
                    .transition(.move(edge: .trailing))
                    .zIndex(4)
    //                    .gesture(DragGesture()
    //                        .onChanged { val in
    //                            self.xOffset = val.translation.width
    //                        }
    //                        .onEnded { val in
    //                            self.xOffset = .zero
    //                        }
    //                    )
            }
        }
    }
    private var sideMenuButton: some View {
        Button {
            showMenu.toggle()
        } label: {
            Image(systemName: "line.3.horizontal")
                .resizable()
                .foregroundColor(.black)
                .frame(width: 30,height: 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
