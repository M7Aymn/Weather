//
//  ContentView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct FirstScreen: View {
    @State private var weather: Weather?
    @State private var isDay = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                if let weather = weather {
                    BackgroundView(isDay: isDay)
                    
                    VStack {
                        Spacer()
                        
                        CurrentSummary(
                            locationName: weather.location.name,
                            temperature: weather.current.tempC,
                            weatherCondition: weather.current.condition.text,
                            maxTemp: weather.forecast.forecastday[0].day.maxtempC,
                            minTemp: weather.forecast.forecastday[0].day.mintempC,
                            conditionIconURL: "https:" + weather.current.condition.icon
                        )
                        
                        Spacer()
                        
                        DaysForecast(
                            forecastDays: weather.forecast.forecastday,
                            isDay: isDay
                        )
                        
                        Spacer()
                        
                        CurrentConditions(current: weather.current)
                        
                        Spacer()
                    }
                    .padding()
                    .foregroundStyle(isDay ? .black : .white)
                } else {
                    LinearGradient(colors: [.indigo, .black], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    VStack{
                        ProgressView()
                            .scaleEffect(2)
                            .frame(height: 75)
                            .tint(.white)
                        Text("loading")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .task {
                        NetworkService.load { Weather in
                            self.weather = Weather
                            self.isDay = Weather.current.isDay == 1
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FirstScreen()
}
