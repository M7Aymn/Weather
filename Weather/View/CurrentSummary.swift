//
//  CurrentSummary.swift
//  Weather
//
//  Created by Mohamed Ayman on 24/08/2024.
//

import SwiftUI

struct CurrentSummary: View {
    let locationName: String
    let temperature: Double
    let weatherCondition: String
    let maxTemp: Double
    let minTemp: Double
    let conditionIconURL: String
    
    
    var body: some View {
        VStack {
            Text(locationName)
                .bold()
            Text(String(format: "%.1f°", temperature))
                .bold()
            Text(weatherCondition)
            Text(
                String(format: "H:%.1f° L:%.1f°", maxTemp, minTemp)
            )
            ConditionImage(urlString: conditionIconURL)
                .frame(width: 110, height: 110)
                .padding(-45)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    CurrentSummary(locationName: "Zagazig", temperature: 33.6, weatherCondition: "clear", maxTemp: 37.3, minTemp: 25.6, conditionIconURL: "https://cdn.weatherapi.com/weather/64x64/night/113.png")
}
