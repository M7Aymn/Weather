//
//  SecondSereenViewTests.swift
//  WeatherTests
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import XCTest
import SwiftUI
@testable import Weather

final class SecondSereenViewTests: XCTestCase {
    
    func testHourView() {
        XCTAssertNotNil(dummyWeather)
        let hourView = HourView(hour: dummyWeather.forecast.forecastday[0].hour[0])
        let _ = hourView.body
        let hostingController = UIHostingController(rootView: hourView)
        hostingController.loadViewIfNeeded()
        XCTAssertEqual(hostingController.rootView.hour.isDay, dummyWeather.forecast.forecastday[0].hour[0].isDay)
    }
    
    func testSecondView() {
        let secondScreenView = SecondScreenView(hours: dummyWeather.forecast.forecastday[0].hour, isDay: dummyWeather.current.isDay == 1, title: "Day Name")
        let _ = secondScreenView.body
        let hostingController = UIHostingController(rootView: secondScreenView)
        hostingController.loadViewIfNeeded()
        XCTAssertEqual(hostingController.rootView.hours.count, dummyWeather.forecast.forecastday[0].hour.count)
        
    }
    
}
