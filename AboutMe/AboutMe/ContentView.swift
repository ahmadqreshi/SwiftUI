//
//  ContentView.swift
//  AboutMe
//
//  Created by Ahmad Qureshi on 01/05/22.
//

import SwiftUI
import LAResources

struct ContentView: View {
    var body: some View {
        ZStack {
            ColorAsset.bluishCyan.set
            VStack {
                Image("Ahmad_pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 200, alignment: .top)
                    .clipShape(Circle())
                    .overlay(
                    Circle()
                        .stroke(Color.white,lineWidth: 3)
                )
                Text("Ahmad Qureshi").font(.system(size: 25)).foregroundColor(.white)
                Text("iOS Developer").font(.system(size: 18)).foregroundColor(.white)
                Divider()
                CustomUI(text :  "+91 9719442231", imgName : "phone.fill")
                CustomUI(text: "ahmadqureshi40@gmail.com", imgName: "mail.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait).previewDevice("Iphone 12")
        }
    }
}
