//
//  SlotDropDownMenuList.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 05/09/23.
//

import SwiftUI

struct SlotDropDownMenuList: View {

    let options: [Slot]
    
    let onSelectedAction: (_ option: Slot) -> Void
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 2) {
                ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Button {
                            self.onSelectedAction(option)
                        } label: {
                            Text(option.timingText)
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                        }
                        if index != options.count - 1 {
                            Rectangle()
                                .fill(Color(hex: "#505050"))
                                .frame(height: 0.5)
                        }
                    }
                }
            }
        }
        .frame(height: CGFloat(self.options.count * 40) > 300
               ? 300
               : CGFloat(self.options.count * 45)
        )
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(hex: "#181818"))
        )
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(hex: "666666"), lineWidth: 1)
        }
    }
}
