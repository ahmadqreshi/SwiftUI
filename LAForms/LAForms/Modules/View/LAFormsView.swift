//
//  ContentView.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 03/08/23.
//

import SwiftUI



enum QuestionType: String {
    case name
    case email
    case phone
    case text
    case mcq
    case slot
    case utm
}

struct LAFormsView: View {
    @State private var selectedFold: Int = 0
    @StateObject var formsVM: FormsViewModel = FormsViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                foldsIndicatorView
                    .padding(.vertical, 22)
                formFolds
                    .transition(.slide)
                    .animation(.linear, value: selectedFold)
                
                
            }
            .background(
                RadialGradient(
                    colors: [
                        Color(hex: "222432"),
                        Color(hex: "2A2938").opacity(0.8),
                        Color(hex: "121212"),
                        Color(hex: "121212")
                    ],
                    center: .center,
                    startRadius: 0,
                    endRadius: UIScreen.main.bounds.height/2
                )
            )
        }
    }
    
    @ViewBuilder
    var formFolds: some View {
        switch selectedFold {
        case 0:
            firstFoldView
        case 1:
            secondFoldView
        default:
            thirdFoldView
        }
    }
    
    private var foldsIndicatorView: some View {
        HStack(spacing: 8) {
            indicatorView(index: 0)
            
            Rectangle()
                .fill(Color(hex: "#636363"))
                .frame(width: 40, height: 1)
            
            indicatorView(index: 1)
            
            Rectangle()
                .fill(Color(hex: "#636363"))
                .frame(width: 40, height: 1)
            
            indicatorView(index: 2)
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func indicatorView(index: Int) -> some View {
        if index == selectedFold {
            Circle()
                .fill(Color(hex: "#D37036"))
                .frame(width: 12, height: 12)
        } else {
            Circle()
                .stroke(Color(hex: "#636363"), lineWidth: 1)
                .frame(width: 12, height: 12)
        }
    }
    
    private var firstFoldView: some View {
        VStack(spacing: 0) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text(formsVM.formTitle)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.leading)
                
                Text(formsVM.formsDescription)
                    .foregroundColor(Color(hex: "#C6C6C6"))
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 32)
            
            VStack(spacing: 20) {
                ForEach(formsVM.firstFoldQuestions, id: \.questionID) { question in 
                    let type = QuestionType(rawValue: question.type)
                    switch type {
                    case .name:
                        NameQuestionView(viewModel: formsVM, question: question)
                    case .email:
                        EmailQuestionView(viewModel: formsVM, question: question)
                    case .phone:
                        PhoneQuestionView(viewModel: formsVM, question: question)
                    default:
                        EmptyView()
                    }
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            HStack {
                Spacer()
                formButton(title: "Next") {
                    if !formsVM.name.isEmpty && !formsVM.email.isEmpty && !formsVM.phoneNumber.isEmpty {
                        selectedFold = 1
                    }
                }
            }
            .padding(.trailing, 16)
            .padding(.bottom, 70)
            
        }
    }
    
    private var secondFoldView: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                ForEach(Array(formsVM.secondFoldQuestions.enumerated()), id: \.offset) { index, question in
                    let type = QuestionType(rawValue: question.type)
                    switch type {
                    case .mcq:
                        McqQuestionView(viewModel: formsVM, question: question)
                    case .text:
                        TextQuestionView(viewModel: formsVM, question: question)
                    case .slot:
                        McqQuestionView(viewModel: formsVM, question: question)
                    default:
                        EmptyView()
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 32)
            Spacer(minLength: 50)
            HStack {
                Spacer()
                                
                formButton(title: "Next") {
                    if formsVM.canProceed(questions: formsVM.secondFoldQuestions) {
                        selectedFold = 2
                    } else {
                        debugPrint("Can not Proceed")
                    }
                }
            }
            .padding(.trailing, 16)
            .padding(.bottom, 70)

        }
    }
    
    private var thirdFoldView: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                ForEach(formsVM.thirdFoldQuestions, id: \.questionID) { question in
                    let type = QuestionType(rawValue: question.type)
                    switch type {
                    case .mcq:
                        McqQuestionView(viewModel: formsVM, question: question)
                    case .text:
                        TextQuestionView(viewModel: formsVM, question: question)
                    case .slot:
                        McqQuestionView(viewModel: formsVM, question: question)
                    default:
                        EmptyView()
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 32)
            Spacer(minLength: 50)
            HStack {
                Spacer()
                
                formButton(title: "Submit") {
                    if formsVM.canProceed(questions: formsVM.thirdFoldQuestions) {
                        debugPrint(formsVM.answers)
                    } else {
                        debugPrint("Can not Proceed")
                    }
                }
            }
            .padding(.trailing, 16)
            .padding(.bottom, 70)
        }
    }
    
    
    @ViewBuilder private func formButton(title: String, action: @escaping( () -> Void ) ) -> some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 14))
                .padding(.horizontal, 40)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(hex: "#D37036"))
                )
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LAFormsView()
    }
}
