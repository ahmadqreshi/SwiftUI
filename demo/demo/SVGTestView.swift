//
//  SVGTestView.swift
//  demo
//
//  Created by Ahmad Qureshi on 27/10/22.
//

import SwiftUI

struct SVGTestView: View {
    var body: some View {
        Image("purzen_Skull")
            .resizable()
            .scaledToFit()
            .frame(width: 50,height: 50)
    }
}

struct SVGTestView_Previews: PreviewProvider {
    static var previews: some View {
        SVGTestView()
    }
}
