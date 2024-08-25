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
    @State private var cityName = ""
    
    var body: some View {
        
        if let weather = weather {
            NavigationStack {
                ZStack {
                    BackgroundView(isDay: isDay)
                    
                    ScrollView {
                    
                        VStack {
                            TextField("Search for city", text: $cityName)
                                .padding(5)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.ultraThinMaterial)
                                        .shadow(radius: 4)
                                )
                                .padding()
                                .onSubmit {
                                    loadWeatherData(for: cityName)
                                    cityName = ""
                                }
                            
                            Spacer()
                            CurrentView(weather: weather)
                            Spacer()
                            ForecastView(forecastDays: weather.forecast.forecastday, isDay: isDay)
                            Spacer()
                            ConditionsView(current: weather.current)
                            Spacer()
                        }
                        .foregroundStyle(isDay ? .black : .white)
                        .frame(minHeight: UIScreen.main.bounds.height * 0.9)
                    }
                }
                
            }
            
        } else {
            LoadingView()
                .task {
                    loadWeatherData(for: "30.0715495,31.0215953")
                }
        }
    }
    
    private func loadWeatherData(for city: String) {
        NetworkService.load(search: city) { weather in
            self.cityName = ""
            self.weather = weather
            self.isDay = weather.current.isDay == 1
        }
    }
}

#Preview {
    FirstScreenView()
}
