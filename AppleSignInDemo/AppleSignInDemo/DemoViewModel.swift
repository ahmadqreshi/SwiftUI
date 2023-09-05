//
//  DemoViewModel.swift
//  AppleSignInDemo
//
//  Created by Ahmad Qureshi on 27/02/23.
//

import Foundation
import AuthenticationServices
class DemoViewModel: ObservableObject {
    private var signInWithAppleViewModel: SignInWithAppleViewModel!
    func showAppleLoginView() {
        signInWithAppleViewModel = SignInWithAppleViewModel()
        debugPrint("show apple login view callws")
        // 1. Instantiate the AuthorizationAppleIDProvider
        let provider = ASAuthorizationAppleIDProvider()
        // 2. Create a request with the help of provider - ASAuthorizationAppleIDRequest
        let request = provider.createRequest()
        // 3. Scope to contact information to be requested from the user during authentication.
        request.requestedScopes = [.fullName, .email]
        // 4. A controller that manages authorization requests created by a provider.
        let controller = ASAuthorizationController(authorizationRequests: [request])
        // 5. Set delegate to perform action
        controller.delegate = signInWithAppleViewModel
        // 6. Initiate the authorization flows.
        controller.performRequests()
    }
}
