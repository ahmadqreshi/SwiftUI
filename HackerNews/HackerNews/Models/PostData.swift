//
//  PostData.swift
//  HackerNews
//
//  Created by Ahmad Qureshi on 09/05/22.
//

import Foundation
struct PostData : Decodable{
    var hits : [Post]
}
struct Post : Identifiable, Decodable {
    var id : String {
        return objectID
    }
    var objectID : String
    var title : String
    var points : Int
    var url : String?
}
