//
//  TextAlignment+Ext.swift
//  LACustomTextField
//
//  Created by Ahmad Qureshi on 27/11/22.
//

import Foundation
import SwiftUI

extension TextAlignment {
    func getAlignment() -> Alignment {
        self == .leading ? Alignment.leading : self == .trailing ? Alignment.trailing : Alignment.center
    }
}
