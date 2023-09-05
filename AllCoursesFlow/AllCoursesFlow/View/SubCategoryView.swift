//
//  SubCategoryView.swift
//  AllCoursesFlow
//
//  Created by Ahmad Qureshi on 15/12/22.
//

import SwiftUI
struct SubCategoryView: View {
    var title: String
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .padding(.horizontal,16)
            .padding(.vertical,10)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
            }
    }
}

