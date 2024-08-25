//
//  CurrentView.swift
//  Weather
//
//  Created by Mohamed Ayman on 24/08/2024.
//

import SwiftUI

struct CurrentView: View {
    let weather: WeatherModel
    
    var body: some View {
        VStack(spacing: 0) {
            Text(weather.location.name)
                .font(.largeTitle.bold())
            Text(String(format: "%.1f°", weather.current.tempC))
                .font(.largeTitle.bold())
            Text(weather.current.condition.text)
            Text(
                String(format: "H:%.1f° L:%.1f°", weather.forecast.forecastday[0].day.maxtempC, weather.forecast.forecastday[0].day.mintempC)
            )
            IconView(urlString: "https:" + weather.current.condition.icon, length: 110, vPadding: -25)
        }
        .font(.title)
    }
}

#Preview {
    CurrentView(weather: dummyWeather)
}
