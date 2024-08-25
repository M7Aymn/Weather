//
//  LocalService.swift
//  Weather
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import Foundation

var dummyWeather: WeatherModel! = load("giza.json")

func load <T: Decodable> (_ fileName: String) -> T? {
    var data: Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {return nil}
    do {
        data = try Data(contentsOf: file)
    } catch {return nil}
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {return nil}
}
