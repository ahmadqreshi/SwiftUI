//
//  ContentView.swift
//  DragGesture
//
//  Created by Ahmad Qureshi on 04/01/23.
//

import SwiftUI


struct CustomView: View {
    @Binding var showMenu: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(showMenu ? .yellow : .clear)
        }
    }
}


struct ChildView: View {
    var body: some View {
        SideMenuBaseView {
            ZStack {
                Rectangle()
                    .foregroundColor(.blue)
            }
        }
    }
}

struct SideMenuBaseView<Content> : View where Content : View{
    @ViewBuilder var content: () -> Content
    @State private var showMenu: Bool = false
    @State private var xOffset: CGFloat = .zero
    var body: some View {
        ZStack {
            content()
            GeometryReader { geometry in
                CustomView(showMenu: $showMenu)
                    .frame(width: geometry.size.width/1.2, alignment: .leading)
                    .offset(x: self.showMenu ? xOffset : -geometry.size.width)
                    .animation(.linear(duration: 0.3), value: showMenu)
                    .transition(.move(edge: .leading))
                    .zIndex(4)
            }
        }
        .gesture(DragGesture()
            .onChanged{ val in
                if !showMenu && val.translation.width > 0 {
                    self.xOffset = val.translation.width
                }
                if val.translation.width < 0 {
                    self.xOffset = val.translation.width
                }
            }
            .onEnded{ val in
                if val.translation.width > 100 {
                    showMenu = true
                    xOffset = .zero
                } else if val.translation.width < -100 {
                    showMenu = false
                    xOffset = .zero
                } else {
                    xOffset = .zero
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView()
    }
}
