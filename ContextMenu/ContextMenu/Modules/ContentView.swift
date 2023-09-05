//
//  ContentView.swift
//  ContextMenu
//
//  Created by Ahmad Qureshi on 28/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var backgroundColor: Color = .teal
    @State var isAnimate: Bool = false
    var body: some View {
        ZStack {
            VStack(spacing: 50) {
                VStack(alignment: .leading,spacing: 10) {
                    Image(systemName: "house.fill")
                    Text("Ahmad Qureshi")
                        .font(.headline)
                    Text("iOS Developer")
                        .font(.subheadline)
                }
                .foregroundColor(.white)
                .padding(.all,20)
                .background(backgroundColor)
                .cornerRadius(10)
                .shadow(radius: 20)
                .contextMenu {
                    Button {
                        withAnimation {
                            backgroundColor = .blue
                        }
                    } label: {
                        Text("Blue")
                    }
                    Button {
                        withAnimation {
                            backgroundColor = .black
                        }
                    } label: {
                        Text("Black")
                    }
                    Button {
                        withAnimation {
                            backgroundColor = .yellow
                        }
                    } label: {
                        Text("Yellow")
                    }
                }
                .rotationEffect(Angle(degrees: isAnimate ? 360 : 0))
                .offset(y: isAnimate ? -250 : 0)
                Button {
                    withAnimation(.spring()) {
                        isAnimate.toggle()
                    }
                } label: {
                    Text("Animate")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 100)
                        .padding(.vertical,10)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                        }
                }
                
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
