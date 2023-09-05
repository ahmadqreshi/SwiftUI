//
//  ScrollSafeArea.swift
//  demo
//
//  Created by Ahmad Qureshi on 27/10/22.
//

import SwiftUI

struct ScrollSafeArea: View {
    var body: some View {
        ZStack {
            Color("test")
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .fill(.red)
                    .frame(height: 50)
                    .overlay(alignment: .topLeading) {
                        Text("Hello")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical,15)
                            .padding(.horizontal,20)
                    }
                ScrollView {
                    VStack {
                        ForEach(0..<12) { index in
                            Rectangle()
                                .fill(.blue)
                                .frame(height: 100)
                                .padding(.horizontal,30)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct ScrollSafeArea_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSafeArea()
    }
}
