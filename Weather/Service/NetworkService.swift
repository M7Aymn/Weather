//
//  NetworkService.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import Foundation

struct NetworkService {
    static func load(compilation: @escaping (Weather) -> ()){
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=cb11503253444d2e924131722242208&q=30.0715495,31.0215953&days=3&aqi=yes&alerts=no"
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
                let users = try JSONDecoder().decode(Weather.self, from: data)
                print(users)
                compilation(users)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
