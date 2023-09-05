//
//  FormsModel.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 07/08/23.
//

import Foundation
import SwiftUI

struct FormsModel: Codable {
    let formID: String
    let utmEnabled: Bool
    let title, description: String
    let isActive: Bool
    let questions: [FormQuestion]

    enum CodingKeys: String, CodingKey {
        case formID = "formId"
        case utmEnabled, title, description, isActive, questions
    }
}

// MARK: - Question
class FormQuestion: Codable {
    let questionID, questionText, type: String
    let isRequired: Bool
    let description, placeholder: String?
    let options: [String]?
    let hasOther: Bool?
    let slots: [Slot]?

    enum CodingKeys: String, CodingKey {
        case questionID = "questionId"
        case questionText, type, isRequired, description, placeholder, options, hasOther, slots
    }
}



// MARK: - Slot
struct Slot: Codable {
    let timingText, slotID: String

    enum CodingKeys: String, CodingKey {
        case timingText
        case slotID = "slotId"
    }
}
