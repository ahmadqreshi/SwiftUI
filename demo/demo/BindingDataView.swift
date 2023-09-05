//
//  BindingDataView.swift
//  demo
//
//  Created by Ahmad Qureshi on 07/11/22.
//

import SwiftUI

struct BindingDataView: View {
    @Binding var title: String
    var body: some View {
        Text("Hello world")
            .onAppear{
                title = "changed"
            }
    }
}
