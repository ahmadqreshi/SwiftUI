//
//  AnimationView.swift
//  demo
//
//  Created by Ahmad Qureshi on 27/10/22.
//

import SwiftUI

struct AnimationView: View {
    @State var isAnimating: Bool = false
    var sceenHeight: CGFloat = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Button {
                    withAnimation(.spring()) {
                        isAnimating.toggle()
                    }
                } label: {
                    Text("Press me")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background {
                            Rectangle()
                                .cornerRadius(10)
                        }
                }
                RoundedRectangle(cornerRadius: 10)
                    .fill(isAnimating ? .green : .red)
                    .frame(width:isAnimating ? 100 : 200,height:isAnimating ? 100 : 200)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .offset(y:isAnimating ? sceenHeight/2 : 0)
                    .padding(.top,20)
                Spacer()
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
