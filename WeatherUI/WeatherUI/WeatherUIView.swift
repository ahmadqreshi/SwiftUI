//
//  ContentView.swift
//  WeatherUI
//
//  Created by Ahmad Qureshi on 26/10/22.
//

import SwiftUI

struct WeatherUIView: View {
    @State private var isNight: Bool = false
    var body: some View {
        ZStack {
           BackgroundView(isNight: $isNight)
            VStack(spacing: 0) {
                Text("Cupertino, CA")
                    .foregroundColor(.white)
                    .font(.system(size: 30,weight: .medium))
                    .padding(.top,20)
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 150,height: 150)
                    Text("76°")
                        .foregroundColor(.white)
                        .font(.system(size: 50,weight: .bold))
                }
                Spacer()
                HStack {
                    WeekDaysView(dayName: "MON", dayImage: "cloud.sun.fill", dayTemp: 74)
                    WeekDaysView(dayName: "TUE", dayImage: "cloud.sun.fill", dayTemp: 74)
                    WeekDaysView(dayName: "WED", dayImage: "cloud.sun.fill", dayTemp: 74)
                    WeekDaysView(dayName: "THU", dayImage: "cloud.sun.fill", dayTemp: 74)
                    WeekDaysView(dayName: "FRI", dayImage: "cloud.sun.fill", dayTemp: 74)
                }
                .padding(.top,30)
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change Day time")
                        .frame(width: 280,height: 50)
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .font(.system(size: 20,weight: .bold,design: .default))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherUIView()
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        let colors: [Color] = isNight ? [.gray,.white] : [.blue,.white]
        LinearGradient(gradient: Gradient(colors: colors),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
