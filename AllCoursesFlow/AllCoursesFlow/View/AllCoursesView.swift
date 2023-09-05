//
//  AllCoursesView.swift
//  AllCoursesFlow
//
//  Created by Ahmad Qureshi on 15/12/22.
//

import SwiftUI
enum CourseCategory {
    case trading
    case investing
    case business
}
struct AllCoursesView: View {
    var itemWidth: CGFloat =  UIScreen.main.bounds.width / 3
    @State var xOffset: CGFloat = -UIScreen.main.bounds.width / 3
    @State var courseCategory: CourseCategory = .trading {
        didSet {
            filterSubCategory()
        }
    }
    @State var subCategories = [SubCategory]()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    Text("All Courses")
                        .foregroundColor(.white)
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal,16)
                .padding(.bottom,20)
                VStack(alignment: .leading) {
                    HStack(spacing: 0) {
                        CategoryItemView(title: "Trading", buttonAction: {
                            xOffset = -itemWidth
                            courseCategory = .trading
                        })
                        CategoryItemView(title: "Investing", buttonAction: {
                            xOffset = 0
                            courseCategory = .investing
                        })
                        CategoryItemView(title: "Business", buttonAction: {
                            xOffset = itemWidth
                            courseCategory = .business
                        })
                    }
                    CategoryScrollIndicator(xOffset: $xOffset)
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(subCategories) { sub in
                            SubCategoryView(title: sub.title)
                                .onTapGesture {
                                    debugPrint(sub.title)
                                }
                        }
                    }
                }
                .padding(.top,25)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(subCategories) { _ in
                            AllCoursesCellView()
                                .padding(.all,25)
                                .onTapGesture {
                                    debugPrint("cell tapped")
                                }
                        }
                    }
                }
                Spacer()
            }
        }
        .onAppear{
            courseCategory = .trading
        }
    }
    
    private func filterSubCategory() {
        subCategories = DummyData.filter({ sub in
            sub.type == courseCategory
        })
    }
}

struct AllCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoursesView()
    }
}
