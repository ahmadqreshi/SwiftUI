//
//  FristView.swift
//  demo
//
//  Created by Ahmad Qureshi on 27/10/22.
//

import SwiftUI

struct FristView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: SecondView()) {
                Text("Press me")
                    .foregroundColor(.white)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                    }
            }.buttonStyle(.automatic)
        }
    }
}

struct FristView_Previews: PreviewProvider {
    static var previews: some View {
        FristView()
    }
}
