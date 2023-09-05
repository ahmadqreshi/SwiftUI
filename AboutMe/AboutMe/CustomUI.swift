//
//  CustomUI.swift
//  AboutMe
//
//  Created by Ahmad Qureshi on 01/05/22.
//

import SwiftUI

struct CustomUI: View {
    var text : String
    var imgName : String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).frame( height: 40, alignment: .center).padding().foregroundColor(.white)
            HStack {
                Image(systemName: imgName).foregroundColor(.red)
                Text(text).font(.body)
            }
        }
    }
}

struct CustomUI_Previews: PreviewProvider {
    static var previews: some View {
        CustomUI(text: "hello", imgName: "arrow")
    }
}
