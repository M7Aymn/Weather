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
        VStack(spacing: -8) {
            Text(weather.location.name)
                .font(.largeTitle.bold())
            Text(String(format: "  %.0f°", weather.current.tempC))
                .font(.system(size: 60).bold())
            Text(weather.current.condition.text)
            Text(
                String(format: " H:%.0f° L:%.0f°", weather.forecast.forecastday[0].day.maxtempC, weather.forecast.forecastday[0].day.mintempC)
            )
            IconView(urlString: "https:" + weather.current.condition.icon, length: 110, vPadding: -10)
        }
        .font(.title)
    }
}

#Preview {
    CurrentView(weather: dummyWeather)
}
