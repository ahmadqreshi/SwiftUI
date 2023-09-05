//
//  DeepLinkManager.swift
//  DeepLinkDemo
//
//  Created by Ahmad Qureshi on 13/12/22.
//

import Foundation
class DeeplinkManager {
    enum DeeplinkTarget {
        case home
        case forgetPasswordScreen(token: String, id: String)
    }
    
    class DeepLinkConstants {
        static let scheme = "cws"
        static let host = "phoenix.dev.learnapp.co"
        static let forgetPassPath = "/auth/reset-password"
        static let token = "token"
        static let id = "id"
    }
    // url =htps://phoenix.dev.learnapp.co/auth/reset-password?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzA5MzIzNTIsImV4cCI6MTY3MTAxODc1MiwiYXVkIjoibGVhcm5hcHAiLCJpc3MiOiJoeWRyYTowLjAuMSJ9.fkMYE6ozH080gi9AvFFjWN-Q9mKX-diDw5itjIQZj84&id=fec27665-b96d-4630-a845-dd218732cc65
    func manage(url: URL) -> DeeplinkTarget {
        guard url.scheme == DeepLinkConstants.scheme,
              url.host == DeepLinkConstants.host,
              url.path == DeepLinkConstants.forgetPassPath,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems
        else { return .home }
        
        let query = queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
        
        guard let token = query[DeepLinkConstants.token] else { return .home }
        guard let id = query[DeepLinkConstants.id] else { return .home }
        
        return .forgetPasswordScreen(token: token, id: id)
    }
}
