//
//  ContentView.swift
//  demo
//
//  Created by Ahmad Qureshi on 27/10/22.
//

import SwiftUI

struct DemoView: View {
    @State var bgColor: Color = Color.gray
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack {
            bgColor
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 20){
                CommonTextField(placeholder: "Enter Your Name", textInput: $email)
                    .padding(.top,50)
                CommonTextField(placeholder: "Enter Your Password", textInput: $password)
                CommonBtn(bgColor: $bgColor, email: $email, password: $password)
                    .padding(.top,30)
                    .padding(.leading,20)
                Spacer()
            }
        }
    }
}
struct CommonBtn: View {
    @Binding var bgColor: Color
    @Binding var email: String
    @Binding var password: String
    var body: some View {
        Button {
            if email.lowercased() == "ahmad" && password == "8799" {
                bgColor = .green
            } else {
                bgColor = .red
            }
        } label: {
            Text("Log In")
                .bold()
                .foregroundColor(.white)
                .frame(width:150 ,height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}

struct CommonTextField: View {
    var placeholder: String
    @Binding var textInput: String
    var body: some View {
        TextField(placeholder, text: $textInput)
            .frame(height: 50)
            .padding(.leading,10)
            .background {
                Color.white
            }
            .cornerRadius(10)
            .shadow(color: .blue, radius: 10)
            .padding(.horizontal,20)
    }
}
