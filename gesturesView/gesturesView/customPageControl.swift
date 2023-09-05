//
//  customPageControl.swift
//  gesturesView
//
//  Created by Ahmad Qureshi on 09/11/22.
//

import SwiftUI

struct customPageControl: View {
    @State var movetoNext: CGFloat = 0
    @State var pageWidth: CGFloat = 50
    var body: some View {
        VStack {
            Rectangle()
                .fill(.green)
                .frame(width: pageWidth,height: 10)
                .cornerRadius(5)
                .offset(x:movetoNext)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(.gray)
                .cornerRadius(5)
                .padding()
            Text("Next")
                .foregroundColor(.white)
                .padding(.all,10)
                .background(.blue)
                .cornerRadius(10)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        movetoNext += pageWidth
                    }
                }
            CustomButton(buttonTitle: "Press me") {
//                debugPrint("hello")
                withAnimation(.easeInOut) {
                    movetoNext += pageWidth
                }
            }
        }
        .onAppear {
            pageWidth = (UIScreen.main.bounds.width - 20) / 5
        }
    }
}

struct customPageControl_Previews: PreviewProvider {
    static var previews: some View {
        customPageControl()
    }
}


struct CustomButton: View {
    let buttonTitle: String
    let buttonAction: (() -> Void)
    var body: some View {
        Button {
            buttonAction()
        } label: {
            Text(buttonTitle)
                .font(.system(size: 16))
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding(.vertical,16)
                .background(Color("BtnColor"))
                .cornerRadius(10)
                .padding(.horizontal,16)
        }
    }
}
