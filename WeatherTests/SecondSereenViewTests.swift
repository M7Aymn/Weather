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
        let viewModel = SecondScreenViewModel(hours: dummyWeather.forecast.forecastday[0].hour, localTime: dummyWeather.location.localtime, isDay: dummyWeather.current.isDay == 1, title: "Today")
        let hourView = HourView(viewModel: viewModel, index: 10)
        let _ = hourView.body
        let hostingController = UIHostingController(rootView: hourView)
        hostingController.loadViewIfNeeded()
        XCTAssertEqual(hostingController.rootView.viewModel.localTime, dummyWeather.location.localtime)
    }
    
    func testSecondView() {
        let viewModel = SecondScreenViewModel(hours: dummyWeather.forecast.forecastday[0].hour, localTime: dummyWeather.location.localtime, isDay: dummyWeather.current.isDay == 1, title: "Today")
        let secondScreenView = SecondScreenView(viewModel: viewModel)
        let _ = secondScreenView.body
        let hostingController = UIHostingController(rootView: secondScreenView)
        hostingController.loadViewIfNeeded()
        XCTAssertEqual(hostingController.rootView.viewModel.localTime, dummyWeather.location.localtime)
    }
    
}
