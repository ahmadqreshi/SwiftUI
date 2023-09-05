//
//  SignInWithAppleButton.swift
//  AppleSignInDemo
//
//  Created by Ahmad Qureshi on 27/02/23.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonSwiftUI: View {
    var body: some View {
        SignInButton(SignInWithAppleButton.Style.whiteOutline)
    }

    func SignInButton(_ type: SignInWithAppleButton.Style) -> some View{
        return SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName, .email]
        } onCompletion: { result in
            switch result {
            case .success(let authResults):
                print("Authorisation successful \(authResults)")
            case .failure(let error):
                print("Authorisation failed: \(error.localizedDescription)")
            }
        }
        .frame(width: 280, height: 60, alignment: .center)
        .signInWithAppleButtonStyle(type)
    }
}
