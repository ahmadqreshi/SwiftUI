//
//  SignInWithAppleButtonUIKit.swift
//  AppleSignInDemo
//
//  Created by Ahmad Qureshi on 27/02/23.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonUIKit: UIViewRepresentable {
  typealias UIViewType = ASAuthorizationAppleIDButton
  
  func makeUIView(context: Context) -> UIViewType {
      return ASAuthorizationAppleIDButton(type: .signUp, style: .white)
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
  }
}
