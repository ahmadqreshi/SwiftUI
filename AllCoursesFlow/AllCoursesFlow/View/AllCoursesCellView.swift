//
//  AllCoursesCellView.swift
//  AllCoursesFlow
//
//  Created by Ahmad Qureshi on 15/12/22.
//

import SwiftUI

struct AllCoursesCellView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            HStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Image("demo")
                        .resizable()
                    .scaledToFit()
                    Image("play")
                        .padding(.leading,10)
                        .padding(.bottom,10)
                }
                VStack(alignment: .leading) {
                    Text("Basics Of Trading")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text("Prateek Singh, CEO LearnApp")
                        .foregroundColor(.gray)
                    Spacer()
                    HStack {
                        
                        HStack(spacing: 10) {
                            Image("students")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                            Text("5200 Students")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        Spacer()
                        HStack(spacing: 10) {
                            Image("time")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                            Text("1hr 20 mins")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                    }
                }
                .padding(.horizontal,20)
                    
            }
        }
        .frame(height: 130)
    }
}

struct AllCoursesCellView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoursesCellView()
    }
}
