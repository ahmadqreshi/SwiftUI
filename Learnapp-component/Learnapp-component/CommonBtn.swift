//
//  CommonBtn.swift
//  Learnapp-component
//
//  Created by Ahmad Qureshi on 09/11/22.
//

import SwiftUI
struct CustomButton: View {
    let buttonTitle: String
    let buttonAction: (() -> Void)
    var body: some View {
        Button {
            buttonAction()
        } label: {
            Text(buttonTitle)
                .font(.system(size: 16))
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding(.vertical,16)
                .background(Color("BtnColor"))
                .cornerRadius(10)
                .padding(.horizontal,16)
        }
    }
}

