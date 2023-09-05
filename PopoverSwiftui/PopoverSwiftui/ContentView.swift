//
//  ContentView.swift
//  PopoverSwiftui
//
//  Created by Ahmad Qureshi on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showPopover: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("iOS")
                    .font(.system(size: 38))
                    .fontWeight(.black)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.pink, .purple, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    
                Spacer()
                Button {
                    showPopover
                        .toggle()
                } label: {
                    Text("Press me")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .cornerRadius(8)
                }
            }
        }
        .padding(.vertical, 50)
        .popover(
            isPresented: $showPopover,
            attachmentAnchor: .point(.trailing),
            arrowEdge: .trailing
        ) {
            Text("Hello How Are you")
                .frame(height: 200)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
