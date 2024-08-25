//
//  WeatherModel.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import Foundation

struct WeatherModel: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

struct Current: Codable {
    let tempC: Double
    let isDay: Int
    let condition: Condition
    let pressureMB: Int
    let humidity: Int
    let feelslikeC: Double
    let visKM: Int
    let time: String?
    
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case pressureMB = "pressure_mb"
        case humidity
        case feelslikeC = "feelslike_c"
        case visKM = "vis_km"
        case time
    }
}

struct Condition: Codable {
    let text: String
    let icon: String
}

struct Forecast: Codable {
    let forecastday: [Forecastday]
}

struct Forecastday: Codable {
    let date: String
    let day: Day
    let hour: [Current]
}

struct Day: Codable {
    let maxtempC: Double
    let mintempC: Double
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition
    }
}

struct Location: Codable {
    let name: String
    let localtime: String
}
