//
//  CustomSecureField.swift
//  Learnapp-component
//
//  Created by Ahmad Qureshi on 14/11/22.
//

import SwiftUI

struct CustomSecureField: View {
    var placeholderText: String
    @Binding var text: String
    @State private var movePlacholder: Bool = false
    @State private var isSecureField: Bool = true
    init(_ placeholderText: String, text: Binding<String>) {
        self.placeholderText = placeholderText
        self._text = text
    }
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(.gray)
            Text(placeholderText)
                .foregroundColor(.white)
                .font(.system(size: 16))
                .offset(x: movePlacholder ? 26 : 16,y:movePlacholder ? -25 : 0)
                .scaleEffect(movePlacholder ? 0.6 : 1,anchor: .leading)
            HStack {
                if isSecureField {
                    TextField("", text: $text,onEditingChanged: { (isEdit) in
                        withAnimation(.spring()) {
                            movePlacholder = isEdit || !text.isEmpty
                        }
                    })
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .accentColor(.white)
                    .onTapGesture {
                        movePlacholder = true || !text.isEmpty
                    }
                } else {
                    TextField("", text: $text,onEditingChanged: { (isEdit) in
                        withAnimation(.spring()) {
                            movePlacholder = isEdit || !text.isEmpty
                        }
                    })
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .accentColor(.white)
                }
                Image(systemName: isSecureField ? "eye.slash" : "eye")
                    .frame(width: 20,height: 20)
                    .foregroundColor(.white)
                    .onTapGesture {
                        isSecureField.toggle()
                    }
            }
            .animation(.easeInOut(duration: 0.2), value: isSecureField)
            .padding(.horizontal,16)
        }
        .frame(height: 50)
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField("Enter your name", text: .constant(""))
    }
}
