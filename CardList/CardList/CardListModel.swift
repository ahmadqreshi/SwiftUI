//
//  CardListModel.swift
//  CardList
//
//  Created by Ahmad Qureshi on 26/10/22.
//

import Foundation
struct CardListModel: Identifiable{
    var id: String = UUID().uuidString
    var name: String
    var description: String
}
