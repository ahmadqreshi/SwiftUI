//
//  CardView.swift
//  CardList
//
//  Created by Ahmad Qureshi on 26/10/22.
//

import SwiftUI
import LAResources
struct CardView: View {
    var name: String
    var description: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Dimensions.cg4)
                .fill(Color("custom"))
                .frame(height: 200)
                .padding(.horizontal,Dimensions.cg20)
            VStack {
                HStack(alignment: .top) {
                    Spacer()
                        .frame(width: Dimensions.cg40)
                    Image(name)
                        .resizable()
                        .scaledToFit()
                        .frame(height: Dimensions.cg100)
                        .cornerRadius(Dimensions.cg10)
                        .padding(.top,Dimensions.cg20)
                    Spacer()
                        .frame(width: Dimensions.cg20)
                    VStack(alignment: .leading) {
                        Text(description)
                            .font(AppFonts.manropeExtrabold.withDefaultSize())
                            .foregroundColor(.white)
                            .padding(.top,20)
                        Text("Joined in Feb")
                            .font(AppFonts.manropeBold.withSize(15))
                            .foregroundColor(.secondary)
                        LottieView(fileName: Environment().configuration(.lottieName), isLooping: true)
                    }.frame(height: 200)
                    Spacer()
                }
            }
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(name: "Ahmad", description: "Ios Developer")
    }
}
