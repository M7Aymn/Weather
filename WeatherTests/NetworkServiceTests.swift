//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import XCTest
@testable import Weather

final class NetworkServiceTests: XCTestCase {
    
    func testNetworkDataLoading() throws {
        let expectation = expectation(description: "Loading weather data")
        NetworkService.load() { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result.location.name, "Giza")
            XCTAssertEqual(result.forecast.forecastday.count, 3)
            XCTAssertEqual(result.forecast.forecastday[0].hour.count, 24)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }
    
}
