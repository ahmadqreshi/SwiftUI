//
//  NavigationBar.swift
//  Learnapp-component
//
//  Created by Ahmad Qureshi on 15/11/22.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Circle()
                .fill(.gray)
                .frame(height: 25)
                .overlay {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(height: 10)
                }
            Spacer()
            Text("Login")
            Spacer()
            
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
