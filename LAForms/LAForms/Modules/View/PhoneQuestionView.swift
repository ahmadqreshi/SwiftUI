//
//  PhoneQuestionView.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 07/08/23.
//

import SwiftUI

struct PhoneQuestionView: View {
    @ObservedObject var viewModel: FormsViewModel
    @State var countryCode: String = "+91"
    var question: FormQuestion?
    
    var questionText: String {
        question?.questionText ?? ""
    }
    
    var isRequired: Bool {
        question?.isRequired ?? false
    }
    
    // fetch value from user defaults if exist
    var isPhoneExist: Bool {
        return false
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
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
            Text("Enter your 10 digit Whatsapp number")
                .foregroundColor(Color(hex: "#BEBEBE"))
                .font(.system(size: 10))
                .padding(.bottom, 10)
            HStack(alignment: .center, spacing: 10) {
                DropDownView(
                    placeholder: countryCode,
                    selectedOption: $countryCode,
                    options: ["+91", "+92", "+93", "+94"]
                )
                    .frame(width: 100)
                    .disabled(isPhoneExist)
                PrimeTextFieldView(
                    placeHolder: "Enter Phone",
                    text: $viewModel.phoneNumber
                )
                    .disabled(isPhoneExist)
            }
        }
    }
}

struct PhoneQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneQuestionView(viewModel: FormsViewModel())
    }
}
