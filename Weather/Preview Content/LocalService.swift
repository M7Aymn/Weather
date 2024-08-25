//
//  LocalService.swift
//  Weather
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import Foundation

var dummyWeather: Weather = load("giza.json")

func load <T: Decodable> (_ fileName: String) -> T {
    var data: Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("couldn't open file \(fileName)")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("couldn't code data")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("couldn't decode data")
    }
}
