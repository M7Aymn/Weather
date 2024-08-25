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
    
//    remember to update "giza.json" to ensure "hourView" work properly
    func testHourView() {
        XCTAssertNotNil(dummyWeather)
        let hourView = HourView(hour: dummyWeather.forecast.forecastday[2].hour[0], localTime: dummyWeather.location.localtime)
        let _ = hourView.body
        let hostingController = UIHostingController(rootView: hourView)
        hostingController.loadViewIfNeeded()
        XCTAssertEqual(hostingController.rootView.hour.isDay, dummyWeather.forecast.forecastday[2].hour[0].isDay)
    }
    
    func testSecondView() {
        let secondScreenView = SecondScreenView(hours: dummyWeather.forecast.forecastday[2].hour, localTime: dummyWeather.location.localtime, isDay: dummyWeather.current.isDay == 1, title: "Day Name")
        let _ = secondScreenView.body
        let hostingController = UIHostingController(rootView: secondScreenView)
        hostingController.loadViewIfNeeded()
        XCTAssertEqual(hostingController.rootView.hours.count, dummyWeather.forecast.forecastday[2].hour.count)
        
    }
    
}
