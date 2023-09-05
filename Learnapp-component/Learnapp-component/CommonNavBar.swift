//
//  CommonNavBar.swift
//  Learnapp-component
//
//  Created by Ahmad Qureshi on 12/11/22.
//

import SwiftUI

struct CommonNavBar: View {
    @State private var screenTitle: String = ""
    private var backTapped: (() -> Void)
    init(_ screenTitle: String, backButtonAction : @escaping (() -> Void)) {
        self.screenTitle = screenTitle
        self.backTapped = backButtonAction
    }
    var body: some View {
        HStack {
//            Button {
//                backTapped?()
//            } label: {
//                Image(systemName: "arrow.left")
//                    .padding(.all,16)
//                    .onTapGesture {
//                        debugPrint("Back Button Pressed")
//                    }
//            }
            Image(systemName: "arrow.left")
                .padding(.all,16)
                .onTapGesture {
                    backTapped()
                }
            Spacer()
            Text("Title")
                .font(.system(size: 24))
            Spacer()
            Image(systemName: "arrow.left")
                .padding(.all,16)
                .hidden()
        }
    }
}
