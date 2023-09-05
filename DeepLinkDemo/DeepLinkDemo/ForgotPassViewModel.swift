//
//  ForgotPassViewModel.swift
//  DeepLinkDemo
//
//  Created by Ahmad Qureshi on 13/12/22.
//

import Foundation
class ForgotPassViewModel: ObservableObject {
    @Published var email: String = ""
    private var token: String
    private var id: String
    init(token: String, id: String) {
        self.token = token
        self.id = id
    }
    
    func printValues() {
        debugPrint("token: \(token)")
        debugPrint("id: \(id)")
        
        
        guard let url = URL(string: "https://phoenix.dev.learnapp.co/auth/reset-password?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzA4NDMyMjIsImV4cCI6MTY3MDkyOTYyMiwiYXVkIjoibGVhcm5hcHAiLCJpc3MiOiJoeWRyYTowLjAuMSJ9.MRqsFTF4qnTfc0sFPsPGJmnGjSbUBpW3pvMCqsZtijQ&id=fec27665-b96d-4630-a845-dd218732cc65") else { return }
        debugPrint(url.scheme)
        debugPrint(url.host)
        debugPrint(url.path)
    }
}
