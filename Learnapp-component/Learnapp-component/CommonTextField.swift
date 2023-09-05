//
//  CommonTextField.swift
//  Learnapp-component
//
//  Created by Ahmad Qureshi on 12/11/22.
//

import SwiftUI

struct CommonTextField: View {
    var placeholderText: String
    @Binding var text: String
    @State private var movePlacholder: Bool = false
    init(_ placeholderText: String, text: Binding<String>) {
        self.placeholderText = placeholderText
        self._text = text
    }
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(.black)
            Text(placeholderText)
                .foregroundColor(.white)
                .font(.system(size: 16))
                .offset(x: movePlacholder ? 26 : 16,y:movePlacholder ? -25 : 0)
                .scaleEffect(movePlacholder ? 0.6 : 1,anchor: .leading)
            TextField("", text: $text,onEditingChanged: { (isEdit) in
                withAnimation(.spring()) {
                    movePlacholder = isEdit || !text.isEmpty
                }
            })
            .font(.system(size: 14))
            .foregroundColor(.white)
            .padding(.all,16)
            .frame(height: 50)
            .accentColor(.white)
        }
        .frame(height: 50)
    }
}
struct CommonTextField_Previews: PreviewProvider {
    static var previews: some View {
        CommonTextField("Enter your mail", text: .constant(""))
    }
}
