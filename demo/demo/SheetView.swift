//
//  SheetView.swift
//  demo
//
//  Created by Ahmad Qureshi on 28/10/22.
//

import SwiftUI

struct SheetView: View {
    @State var isOpenSheet: Bool = false
    @State var isShowAlert: Bool = false
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            Button {
                //isOpenSheet.toggle()
                isShowAlert.toggle()
            } label: {
                Text("ENTER")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.all,20)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.red)
                    }
            }
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text("Success"))
            }
        }
//        .sheet(isPresented: $isOpenSheet) {
//            ZStack {
//                Color(.blue)
//                    .ignoresSafeArea()
//                Text("HELLO")
//                    .bold()
//                    .foregroundColor(.white)
//            }
//        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
