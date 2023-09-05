//
//  CategoryTabView.swift
//  AllCoursesFlow
//
//  Created by Ahmad Qureshi on 15/12/22.
//

import SwiftUI
struct CategoryItemView: View {
    var title: String
    var buttonAction: () -> Void
    var body: some View {
        Button {
            buttonAction()
        } label: {
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
        }
        .padding(.vertical,15)
        .frame(width: UIScreen.main.bounds.width / 3,height: 60)
        
    }
    
}

struct CategoryScrollIndicator: View {
    @Binding var xOffset: CGFloat
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .overlay {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(height: 5)
                    .frame(maxWidth: UIScreen.main.bounds.width / 3)
                    .offset(x: xOffset)
                    .animation(.easeIn(duration: 0.2), value: xOffset)
                
            }
    }
}
