//
//  ContentView.swift
//  CombineDemo
//
//  Created by Ahmad Qureshi on 08/11/22.
//

import SwiftUI
struct SignUpView: View {
    @ObservedObject private var signUpVM = SignUpViewModel()
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Enter you email", text: $signUpVM.email)
                        .textInputAutocapitalization(.none)
                    Text(signUpVM.errorMessage)
                        .font(.body)
                        .foregroundColor(.red)
                }
                Section {
                    TextField("Enter you password", text: $signUpVM.password)
                        .textInputAutocapitalization(.none)
                    TextField("Enter you password", text: $signUpVM.password)
                        .textInputAutocapitalization(.none)
                }
                Section {
                    Button {
                        signUpVM.signUp()
                    } label: {
                        Text("Sign up")
                    }
                    //.disabled(!signUpVM.isValid)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
