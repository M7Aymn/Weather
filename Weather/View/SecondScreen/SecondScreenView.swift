//
//  SecondScreenView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct SecondScreenView: View {
    let hours: [Current]
    let localTime: String
    let isDay: Bool
    let title: String
    
    var body: some View {
        ZStack {
            BackgroundView(isDay: isDay)
            
            ScrollView {
                ForEach(hours, id: \.time) { hour in
                    HourView(hour: hour, localTime: localTime)
                        .padding()
                }
                .padding(.vertical, 30)
                .frame(width: UIScreen.main.bounds.width)
                .foregroundStyle(isDay ? .black : .white)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(title)
                    .font(.title)
                    .foregroundStyle(isDay ? .black : .white)
            }
        }
    }
}

#Preview {
    SecondScreenView(hours: dummyWeather.forecast.forecastday[0].hour, localTime: dummyWeather.location.localtime, isDay: dummyWeather.current.isDay == 1, title: "Day Name")
}
