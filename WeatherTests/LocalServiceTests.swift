//
//  LocalServiceTests.swift
//  WeatherTests
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import XCTest
@testable import Weather

final class LocalServiceTests: XCTestCase {
    
    func testDummyWeather() throws {
        XCTAssertNotNil(dummyWeather)
        XCTAssertEqual(dummyWeather.location.name, "Giza")
        XCTAssertEqual(dummyWeather.forecast.forecastday.count, 3)
        XCTAssertEqual(dummyWeather.forecast.forecastday[0].hour.count, 24)
        
    }
}
