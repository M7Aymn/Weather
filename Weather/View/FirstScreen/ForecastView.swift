//
//  ForecastView.swift
//  Weather
//
//  Created by Mohamed Ayman on 24/08/2024.
//

import SwiftUI

struct ForecastView: View {
    let forecastDays: [Forecastday]
    let isDay: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("3-DAY FORECAST")
                .font(.subheadline)
            
            ForEach(forecastDays, id: \.date) { dayForecast in
                Rectangle().frame(height: 1)
                
                let (dayName, dayNameShort) = DateFormat.dayOfWeek(from: dayForecast.date)
                
                NavigationLink {
                    SecondScreenView(hours: dayForecast.hour, isDay: isDay, title: dayName)
                } label: {
                    HStack {
                        
                        Text(dayNameShort)
                            .frame(width: 120, alignment: .leading)
                        IconView(urlString: "https:" + dayForecast.day.condition.icon, length: 50, vPadding: -2, hPadding: -10)
                        Text(String(format: "%.1f° - %.1f°", dayForecast.day.mintempC, dayForecast.day.maxtempC)
                        )
                        .frame(width: 120, alignment: .trailing)
                    }
                }
            }
        }
        .font(.title3)
        .frame(width: 290)
    }
}

#Preview {
    ForecastView(forecastDays: dummyWeather.forecast.forecastday, isDay: dummyWeather.current.isDay == 1)
        .foregroundStyle(.black)
    // .1f 125 315
}
