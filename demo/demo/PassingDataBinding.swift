//
//  PassingDataBinding.swift
//  demo
//
//  Created by Ahmad Qureshi on 07/11/22.
//

import SwiftUI

struct PassingDataBinding: View {
    @State var btnTitle: String = "Press me"
    var body: some View {
        NavigationView {
            NavigationLink(destination: BindingDataView(title: $btnTitle)) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 100,height: 50)
                    .overlay {
                        Text(btnTitle)
                            .foregroundColor(.white)
                            .bold()
                    }
            }
        }
    }
}

struct PassingDataBinding_Previews: PreviewProvider {
    static var previews: some View {
        PassingDataBinding()
    }
}
