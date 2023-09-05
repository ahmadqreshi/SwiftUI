//
//  DeepLinkDemoApp.swift
//  DeepLinkDemo
//
//  Created by Ahmad Qureshi on 12/12/22.
//

import SwiftUI

@main
struct DeepLinkDemoApp: App {
    @State var deeplinkTarget: DeeplinkManager.DeeplinkTarget?
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    switch self.deeplinkTarget {
                    case .forgetPasswordScreen(let token, let id):
                        ForgotPassView(forgotPassVM: ForgotPassViewModel(token: token, id: id))
                    case .home:
                        HomeView()
                    case .none:
                        HomeView()
                    }
                }
                .onOpenURL { url in
                    let deeplinkManager = DeeplinkManager()
                    let deeplink = deeplinkManager.manage(url: url)
                    self.deeplinkTarget = deeplink
            }
            }
        }
    }
}
