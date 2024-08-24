//
//  DaysForecast.swift
//  Weather
//
//  Created by Mohamed Ayman on 24/08/2024.
//

import SwiftUI

struct DaysForecast: View {
    let forecastDays: [Forecastday]
    let isDay: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("3-DAY FORECAST")
            
            ForEach(forecastDays, id: \.date) { dayForecast in
                Divider().background(.black)
                
                let dayName = DateFormat.dayOfWeek(from: dayForecast.date)
                
                NavigationLink {
                    DayView(hours: dayForecast.hour, isDay: isDay, title: dayName)
                } label: {
                    HStack {
                        
                        Text(dayName)
                            .frame(width: 125, alignment: .leading)
                        ConditionImage(urlString: "https:" + dayForecast.day.condition.icon)
                            .frame(width: 50, height: 50)
                            .padding(.vertical, -10)
                        Text(String(format: "%.1f° - %.1f°", dayForecast.day.mintempC, dayForecast.day.maxtempC)
                        )
                        .frame(width: 125, alignment: .trailing)
                    }
                    .padding(.vertical, 2)
                }
            }
        }
        .font(.title3)
        .frame(width: 300)
        .padding()
    }
}

#Preview {
    DaysForecast(forecastDays: [], isDay: true)
}
