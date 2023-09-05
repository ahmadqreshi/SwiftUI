//
//  WebView.swift
//  HackerNews
//
//  Created by Ahmad Qureshi on 09/05/22.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    let urlString: String?
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl) {
                let urlRequest = URLRequest(url: url)
                uiView.load(urlRequest)
            }
        }
    }
    
}

