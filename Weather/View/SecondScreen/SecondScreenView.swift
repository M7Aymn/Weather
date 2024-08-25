//
//  SecondScreenView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct SecondScreenView: View {
    let hours: [Current]
    let isDay: Bool
    let title: String
    
    var body: some View {
        ZStack {
            BackgroundView(isDay: isDay)
            
            ScrollView {
                ForEach(hours, id: \.time) { hour in
                    HourView(hour: hour)
                        .padding()
                }
                .padding(.vertical, 50)
                .frame(width: UIScreen.main.bounds.width)
                .foregroundStyle(isDay ? .black : .white)
            }
            
        }
        .navigationTitle(title)
        
    }
}

#Preview {
    SecondScreenView(hours: dummyWeather.forecast.forecastday[0].hour, isDay: dummyWeather.current.isDay == 1, title: "Day Name")
}
