//
//  TextQuestionView.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 07/08/23.
//

import SwiftUI

struct TextQuestionView: View {
    
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
            PrimeTextFieldView(
                placeHolder: "Your answer",
                isRequired: isRequired,
                text: viewModel.getBinding(question: question)
            )
        }
    }
}

//struct TextQuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextQuestionView(viewModel: FormsViewModel(), question: <#FormQuestion#>)
//    }
//}
