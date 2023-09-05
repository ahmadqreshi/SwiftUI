//
//  NameQuestionView.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 07/08/23.
//

import SwiftUI

struct NameQuestionView: View {
    @ObservedObject var viewModel: FormsViewModel
    var question: FormQuestion?
    var questionText: String {
        question?.questionText ?? ""
    }
    
    var isRequired: Bool {
        question?.isRequired ?? false
    }
    
    // fetch value from user defaults if exist
    var isNameExist: Bool {
        return false
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
                placeHolder: "Your name",
                isRequired: isRequired,
                text: $viewModel.name
            )
                .disabled(isNameExist)
        }
    }
}

struct NameQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        NameQuestionView(viewModel: FormsViewModel())
    }
}
