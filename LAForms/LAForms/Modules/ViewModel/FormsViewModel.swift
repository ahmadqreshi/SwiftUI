//
//  FormsViewModel.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 07/08/23.
//

import Foundation
import SwiftUI


class FormsViewModel: ObservableObject {
    
    @Published var formData: FormsModel? = readJsonFile()
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var answers: [String: String] = [:]
        
    var questions: [FormQuestion] {
        formData?.questions ?? []
    }
    
    var utmQuestions: [FormQuestion] {
        questions.filter( { $0.type == QuestionType.utm.rawValue } )
    }
    
    var questionsOnly: [FormQuestion] {
        questions.filter( { $0.type != QuestionType.utm.rawValue } )
    }
    
    var formTitle: String {
        formData?.title ?? ""
    }
    
    var formsDescription: String {
        formData?.description ?? ""
    }
    
    var firstFoldQuestions: [FormQuestion] {
        Array(questionsOnly.prefix(3))
    }
    
    var secondFoldQuestions: [FormQuestion] {
        let remainingElements = Array(questionsOnly.suffix(from: 3))
        let numElementsSecondArray = (remainingElements.count + 1) / 2
        return Array(remainingElements.prefix(numElementsSecondArray))
    }
    
    var thirdFoldQuestions: [FormQuestion] {
        let remainingElements = Array(questionsOnly.suffix(from: 3))
        let numElementsSecondArray = (remainingElements.count + 1) / 2
        return Array(remainingElements.suffix(from: numElementsSecondArray))
    }
    
    func getBinding(question: FormQuestion) -> Binding<String> {
        return Binding(
            get: { self.answers[question.questionID, default: ""] },
            set: { self.answers[question.questionID] = $0 }
        )
    }
    
    
    func canProceed(questions: [FormQuestion]) -> Bool {
        var canProceed: Bool = false
        for question in questions {
            if question.isRequired {
                if let ans = answers[question.questionID]{
                    if ans.isEmpty {
                        canProceed = false
                    } else {
                        canProceed = true
                    }
                } else {
                    canProceed = false
                }
            }
        }
        return canProceed
    }
    
}
