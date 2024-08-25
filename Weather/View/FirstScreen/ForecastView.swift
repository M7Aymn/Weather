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
        VStack(alignment: .leading) {
            Text("3-DAY FORECAST")
            
            ForEach(forecastDays, id: \.date) { dayForecast in
                Divider().background(.black)
                
                let dayName = DateFormat.dayOfWeek(from: dayForecast.date)
                
                NavigationLink {
                    SecondScreenView(hours: dayForecast.hour, isDay: isDay, title: dayName)
                } label: {
                    HStack {
                        
                        Text(dayName)
                            .frame(width: 125, alignment: .leading)
                        IconView(urlString: "https:" + dayForecast.day.condition.icon, length: 50, vPadding: -10)
                        Text(String(format: "%.1f° - %.1f°", dayForecast.day.mintempC, dayForecast.day.maxtempC)
                        )
                        .frame(width: 125, alignment: .trailing)
                    }
                }
            }
        }
        .font(.title3)
        .frame(width: 315)
        //        .padding()
    }
}

#Preview {
    ForecastView(forecastDays: dummyWeather.forecast.forecastday, isDay: dummyWeather.current.isDay == 1)
        .foregroundStyle(.black)
}
