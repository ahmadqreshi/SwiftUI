//
//  McqQuestionView.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 07/08/23.
//

import SwiftUI

struct McqQuestionView: View {
    @ObservedObject var viewModel: FormsViewModel
    var question: FormQuestion
    
    var questionText: String {
        question.questionText
    }
    
    var isRequired: Bool {
        question.isRequired
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 0) {
                Text(questionText)
                    .foregroundColor(Color(hex: "#C6C6C6"))
                    .font(.system(size: 14))
            
                if isRequired {
                    Text("*")
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                }
            }
            DropDownView(
                placeholder: "Select any option",
                selectedOption: viewModel.getBinding(question: question),
                questionType: QuestionType(rawValue: question.type) ?? .mcq,
                options: question.options ?? [],
                slots: question.slots ?? []
            )
        }
    }
}

//struct McqQuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        McqQuestionView(
//            viewModel: FormsViewModel(),
//            question: FormQuestion
//        )
//    }
//}
