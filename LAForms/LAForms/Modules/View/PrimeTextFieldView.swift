//
//  PrimeTextFieldView.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 04/08/23.
//

import SwiftUI


struct PrimeTextFieldView: View {
    var placeHolder: String
    var isRequired: Bool = false
    @Binding var text: String
    @State var isTextHasError: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField("", text: $text, onEditingChanged: { bool in
                if text.isEmpty && !bool && isRequired {
                    self.isTextHasError = true
                } else {
                    self.isTextHasError = false
                }
            })
            .placeholder(when: text.isEmpty, placeholder: {
                Text(placeHolder)
                    .foregroundColor(Color(hex: "#666666"))
                    .font(.system(size: 14))
            })
            .font(.system(size: 14))
            .foregroundColor(Color(hex: "#666666"))
            .accentColor(Color(hex: "#666666"))
            .padding(.all, 16)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(hex: "#181818"))
            )
            .overlay (
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isTextHasError ? .red : Color(hex: "#333333"), lineWidth: 1)
            )
            .frame(height: 50)
            .onSubmit {
                if text.isEmpty && isRequired {
                    self.isTextHasError = true
                } else {
                    self.isTextHasError = false
                }
            }
            
            if isTextHasError {
                Text("This is a required field")
                    .font(.footnote)
                    .foregroundColor(.red)
                    .animation(.linear, value: isTextHasError)
            }
            
        }
    }
}

struct PrimeTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PrimeTextFieldView(placeHolder: "Enter Name", text: .constant(""))
    }
}
