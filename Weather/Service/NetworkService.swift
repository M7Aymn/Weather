//
//  NetworkService.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import Foundation

protocol NetworkServiceProtocol {
    static func load(search: String, compilation: @escaping (WeatherModel) -> ())
}

struct NetworkService: NetworkServiceProtocol {
    static func load(search: String, compilation: @escaping (WeatherModel) -> ()){
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=cb11503253444d2e924131722242208&q=\(search)&days=3&aqi=yes&alerts=no"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                compilation(weather)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
