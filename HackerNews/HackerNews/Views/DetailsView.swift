//
//  DetailsView.swift
//  HackerNews
//
//  Created by Ahmad Qureshi on 08/05/22.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    var url : String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "www.google.com")
    }
}

