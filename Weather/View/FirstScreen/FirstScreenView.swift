//
//  FirstScreenView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct FirstScreenView: View {
    @State private var weather: WeatherModel?
    @State private var isDay = false
    
    var body: some View {
        
        if let weather = weather {
            NavigationStack {
                ZStack {
                    BackgroundView(isDay: isDay)
                    VStack {
                        Spacer()
                        CurrentView(weather: weather)
                        Spacer()
                        ForecastView(forecastDays: weather.forecast.forecastday, isDay: isDay)
                        Spacer()
                        ConditionsView(current: weather.current)
                        Spacer()
                    }
                    .foregroundStyle(isDay ? .black : .white)
                }
            }
        } else {
            LoadingView()
                .task {
                    NetworkService.load { Weather in
                        self.weather = Weather
                        self.isDay = Weather.current.isDay == 1
                    }
                }
        }
    }
}

#Preview {
    FirstScreenView()
}
