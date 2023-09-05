//
//  NetworkErrorView.swift
//  NetworkAlert
//
//  Created by Ahmad Qureshi on 08/04/23.
//

import SwiftUI
struct NetworkErrorView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image(systemName: "wifi.exclamationmark")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                Text("Network Error")
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("There was a problem with your internet connection. Please check your settings and try again.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }
            .foregroundColor(.green)
        }
    }
}
struct preview: PreviewProvider {
    static var previews: some View {
        NetworkErrorView()
    }
}

