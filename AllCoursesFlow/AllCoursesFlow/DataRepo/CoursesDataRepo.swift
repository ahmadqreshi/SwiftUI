//
//  CoursesDataRepo.swift
//  AllCoursesFlow
//
//  Created by Ahmad Qureshi on 15/12/22.
//

import Foundation
struct SubCategory: Identifiable {
    let id: String
    let title: String
    var type: CourseCategory
}

let DummyData: [SubCategory] = [
    SubCategory(id: "1", title: "All", type: .trading),
    SubCategory(id: "2", title: "Technical Analysis", type: .trading),
    SubCategory(id: "3", title: "Options", type: .trading),
    SubCategory(id: "4", title: "Options Trading", type: .trading),
    
    SubCategory(id: "5", title: "All", type: .investing),
    SubCategory(id: "6", title: "In-Technical Analysis", type: .investing),
    SubCategory(id: "7", title: "In-Options", type: .trading),
    SubCategory(id: "8", title: "In-Options Trading", type: .investing),
    
    SubCategory(id: "9", title: "All", type: .business),
    SubCategory(id: "10", title: "Bus-Technical Analysis", type: .business),
    SubCategory(id: "11", title: "Bus-Options", type: .trading),
    SubCategory(id: "12", title: "Bus-Options Trading", type: .business)
]
