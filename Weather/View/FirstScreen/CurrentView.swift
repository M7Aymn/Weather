//
//  CurrentView.swift
//  Weather
//
//  Created by Mohamed Ayman on 24/08/2024.
//

import SwiftUI

struct CurrentView: View {
    let locationName: String
    let temperature: Double
    let weatherCondition: String
    let maxTemp: Double
    let minTemp: Double
    let conditionIconURL: String
    
    
    var body: some View {
        VStack(spacing: 0) {
            Text(locationName)
                .font(.largeTitle.bold())
            Text(String(format: "%.1f°", temperature))
                .font(.largeTitle.bold())
            Text(weatherCondition)
            Text(
                String(format: "H:%.1f° L:%.1f°", maxTemp, minTemp)
            )
            IconView(urlString: conditionIconURL, length: 110, vPadding: -25)
        }
        .font(.title)
    }
}

#Preview {
    CurrentView(
        locationName: dummyWeather.location.name,
        temperature: dummyWeather.current.tempC,
        weatherCondition: dummyWeather.current.condition.text,
        maxTemp: dummyWeather.forecast.forecastday[0].day.maxtempC,
        minTemp: dummyWeather.forecast.forecastday[0].day.mintempC,
        conditionIconURL: "https:\(dummyWeather.current.condition.icon)"
    )
}
