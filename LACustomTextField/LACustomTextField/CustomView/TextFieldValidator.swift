//
//  TextFieldValidator.swift
//  LACustomTextField
//
//  Created by Ahmad Qureshi on 27/11/22.
//

import Foundation
public struct TextFieldValidator {
    public var condition: Bool = true
    public var errorMessage: String = ""
    
    public init(condition: Bool, errorMessage: String) {
        self.condition = condition
        self.errorMessage = errorMessage
    }
}
