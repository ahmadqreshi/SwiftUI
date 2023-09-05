//
//  WeekDaysView.swift
//  WeatherUI
//
//  Created by Ahmad Qureshi on 26/10/22.
//

import SwiftUI
struct WeekDaysView: View {
    var dayName: String
    var dayImage: String
    var dayTemp: Int
    var body: some View {
        VStack(spacing: 20) {
            Text(dayName)
                .font(.system(size: 20))
                .foregroundColor(.white)
            Image(systemName: dayImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(dayTemp)°")
                .foregroundColor(.white)
                .font(.system(size: 40,weight: .medium))
        }
    }
}
