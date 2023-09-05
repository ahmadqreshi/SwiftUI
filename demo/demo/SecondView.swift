//
//  SecondView.swift
//  demo
//
//  Created by Ahmad Qureshi on 27/10/22.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "arrow.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }
    }
    }
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            VStack {
                //                HStack {
                //                    Button {
                //                        print("back button pressed")
                //                        presentationMode.wrappedValue.dismiss()
                //                    } label: {
                //                        Image(systemName: "arrow.left")
                //                            .foregroundColor(.white)
                //                            .frame(width: 50,height: 50)
                //                    }
                //                    Spacer()
                //                }
                VStack(spacing: 50) {
                    Text("Hello World")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                        .frame(width: UIScreen.main.bounds.width,alignment: .center)
                    Image("purzen_Skull")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width,height: 200,alignment: .center)
                    Spacer()
                }
            }
        }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
