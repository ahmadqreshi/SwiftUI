//
//  PaddingTexh.swift
//  demo
//
//  Created by Ahmad Qureshi on 03/11/22.
//

import SwiftUI

struct PaddingTexh: View {
    @State var changeColor: Bool = false
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 20)
                .fill(changeColor ? .yellow : .red)
                .frame(height: 200)
//            Button {
//                changeColor.toggle()
//            } label: {
//                Text("Press me")
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 50)
//                    .background(Color.blue)
//                    .cornerRadius(20)
//            }
            CustomButton(text: "Press me")
                .onTapGesture(count: 2) {
                    changeColor.toggle()
                }
            Spacer()
        }
        .padding(.horizontal,20)
    }
}

struct CustomButton: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.blue)
            .cornerRadius(20)
    }
}
struct PaddingTexh_Previews: PreviewProvider {
    static var previews: some View {
        PaddingTexh()
    }
}
