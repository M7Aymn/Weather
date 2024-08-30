//
//  FirstScreenViewModel.swift
//  Weather
//
//  Created by Mohamed Ayman on 29/08/2024.
//

import Foundation

class FirstScreenViewModel: ObservableObject {
    @Published var weather: WeatherModel?
    @Published var isDay = false
    @Published var cityName = ""
    @Published var locationManager = LocationManager()
    
    init() {
        locationManager.locationUpdated = { location in
            self.loadWeatherData(for: "\(location.latitude),\(location.longitude)")
        }
    }
    
    func loadInitialWeatherData() {
        loadWeatherData(for: "30.0715495,31.0215953")
    }
    
    func loadCityData() {
        loadWeatherData(for: cityName)
        cityName = ""
    }
    
    func loadWeatherData(for city: String) {
        NetworkService.load(search: city) { weather in
            DispatchQueue.main.async {
                self.cityName = ""
                self.weather = weather
//                withAnimation {
                self.isDay = weather.current.isDay == 1
//                }
            }
        }
    }
    
    func getDayName(for forecastDay: Forecastday) -> (String, String) {
        return DateFormat.dayOfWeek(from: forecastDay.date, localTime: weather?.location.localtime ?? "")
    }
    
    func prepareForSecondScreen(forecastDay: Forecastday, title: String) -> SecondScreenViewModel {
        return SecondScreenViewModel(
            hours: forecastDay.hour,
            localTime: weather!.location.localtime,
            isDay: isDay,
            title: title
        )
    }
}
