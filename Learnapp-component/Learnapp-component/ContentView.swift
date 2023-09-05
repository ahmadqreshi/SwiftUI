//
//  ContentView.swift
//  Learnapp-component
//
//  Created by Ahmad Qureshi on 09/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var textfieldText: String = ""
    @State var text2: String = ""
    @State var text3: String = ""
    var body: some View {
        VStack {
            CommonNavBar("LearnApp Components") {
                debugPrint("Back Button Pressed")
            }
            TextField("Enter Email", text: $textfieldText)
                .frame(height: 58)
                .padding(.leading,16)
                .frame(maxWidth: .infinity)
                .background(Color("textfieldColor"))
                .cornerRadius(10)
                .padding(.horizontal,16)
                .accentColor(.white)
            CustomButton(buttonTitle: "Log in") {
                debugPrint("hello")
            }
            CommonTextField("Enter your mail", text: $textfieldText)
                .padding(.horizontal,20)
            CommonTextField("Enter your Name", text: $text2)
            CustomSecureField("Enter your Password", text: $text3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct CommonTextField: View {
//    var body: some View {
//
//    }
//}
