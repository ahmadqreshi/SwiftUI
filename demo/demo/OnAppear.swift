//
//  OnAppear.swift
//  demo
//
//  Created by Ahmad Qureshi on 27/10/22.
//

import SwiftUI

struct OnAppear: View {
    @State var name: String = ""
    @State var isRight: Bool = true
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 30) {
                TextField("Enter Your Name", text: $name)
                    .padding()
                    .background {
                        Rectangle()
                            .stroke(isRight ? .blue : .red,lineWidth: isRight ? 0 :2)
                            .background {
                                Color.yellow
                            }
                    }
                    .padding(.horizontal,20)
                    .padding(.top,20)
                Button {
                    if name.lowercased() != "ahmad" {
                        isRight = false
                    }
                } label: {
                    Text("Enter")
                        .foregroundColor(.white)
                        .frame(width: 100,height: 30)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.gray)
                        }
                }
                .padding(.leading,20)
                Spacer()
            }
        }
    }
}

struct OnAppear_Previews: PreviewProvider {
    static var previews: some View {
        OnAppear()
    }
}
