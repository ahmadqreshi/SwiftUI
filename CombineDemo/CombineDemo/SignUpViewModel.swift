//
//  SignUpViewModel.swift
//  CombineDemo
//
//  Created by Ahmad Qureshi on 08/11/22.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordAgain: String = ""
    @Published var isValid: Bool = false
    @Published var errorMessage: String = ""
    func signUp() {
        if email.isEmpty && password.isEmpty {
            isValid = true
            errorMessage = "All feilds are empty"
        }
    }
}
