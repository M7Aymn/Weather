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
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        
        if let weather = weather {
            NavigationStack {
                ZStack {
                    BackgroundView(isDay: isDay)
                    
                    ScrollView {
                        VStack {
                            SearchLocationView(cityName: $cityName, isDay: isDay, locationManager: locationManager) { city in
                                loadWeatherData(for: city)
                            }
                            
                            Spacer()
                            CurrentView(weather: weather)
                            Spacer()
                            ForecastView(forecastDays: weather.forecast.forecastday, localTime: weather.location.localtime, isDay: isDay)
                            Spacer()
                            ConditionsView(current: weather.current)
                            Spacer()
                        }
                        .foregroundStyle(isDay ? .black : .white)
                        .frame(minHeight: UIScreen.main.bounds.height * 0.9)
                    }
                }
                
            }
            .onAppear {
                locationManager.locationUpdated = { location in
                    loadWeatherData(for: "\(location.latitude),\(location.longitude)")
                }
            }
            
        } else {
            LoadingView()
                .onAppear {
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
