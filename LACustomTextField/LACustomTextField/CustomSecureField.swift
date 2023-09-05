//
//  CustomSecureField.swift
//  LACustomTextField
//
//  Created by Ahmad Qureshi on 27/11/22.
//

import Foundation
import SwiftUI

struct CustomSecureField: View {
    private var placeholderText: String
    private var editingChanged: (Bool) -> () = { _ in }
    private var commit: () -> () = { }
    
    @Binding private var text: String
    @Binding private var wrongInput: Bool
    @State private var isSelected: Bool = false
    @State private var movePlacholder: Bool = false
    @State private var isSecureField: Bool = true
    
    @ObservedObject private var notifier = FloatingLabelTextFieldNotifier()
    
    public init(_ placeholder: String,text: Binding<String>,wrongInput: Binding<Bool>, editingChanged: @escaping (Bool)->() = { _ in }, commit: @escaping ()->() = { }) {
        self._text = text
        self.placeholderText = placeholder
        self._wrongInput = wrongInput
        self.editingChanged = editingChanged
        self.commit = commit
    }
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .stroke(.red,lineWidth: wrongInput ? 1 : 0)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.black)
                )
            Text(placeholderText)
                .foregroundColor(.white)
                .offset(x: movePlacholder ? 26 : 16,y:movePlacholder ? -25 : 0)
                .scaleEffect(movePlacholder ? 0.6 : 1,anchor: .leading)
            HStack {
                if isSecureField {
                    SecureField("", text: $text)
                        .foregroundColor(.white)
                        .padding(.top,14)
                        .accentColor(.white)
                        .onTapGesture {
                            self.editingChanged(self.isSelected)
                            self.editingChanged(self.movePlacholder)
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                if let currentResponder = UIResponder.currentFirstResponder, let currentTextField = currentResponder.globalView as? UITextField{
                                    arrTextFieldEditActions = self.notifier.arrTextFieldEditActions
                                    withAnimation {
                                        self.isSelected = self.notifier.isSecureTextEntry
                                    }
                                    currentTextField.setOnTextChangeListener {
                                        self.isSelected = false
                                        self.movePlacholder = self.isSelected || !text.isEmpty
                                        self.commit()
                                        arrTextFieldEditActions = []
                                    }
                                }
                            }
                        }
                } else {
                    TextField("", text: $text,onEditingChanged: { (isEdit) in
                        withAnimation(.easeIn(duration: 0.1)) {
                            movePlacholder = isEdit || !text.isEmpty
                        }
                    })
                    .foregroundColor(.white)
                    .padding(.top,14)
                    .accentColor(.white)
                }
                Image(isSecureField ? "eye.fill" : "eye.slash.fill")
                    .frame(width: 20,height: 20)
                    .foregroundColor(.white)
                    .onTapGesture {
                        isSecureField.toggle()
                    }
            }
            .animation(.easeInOut(duration: 0.1), value: isSecureField)
            .padding(.horizontal,16)
        }
        .frame(height: 56)
    }
}
