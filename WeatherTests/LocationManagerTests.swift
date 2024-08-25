//
//  LocationManagerTests.swift
//  WeatherTests
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import XCTest
import CoreLocation
@testable import Weather

final class LocationManagerTests: XCTestCase {
    
    var locationManager: LocationManager!
    
    override func setUpWithError() throws {
        locationManager = LocationManager()
    }
    
    override func tearDownWithError() throws {
        locationManager = nil
    }

    func testLocationUpdate() {
        let expectation = expectation(description: "Location should be updated")
        
        let dummyLocation = CLLocation(latitude: 37.7749, longitude: -122.4194) // San Francisco coordinates
        locationManager.locationUpdated = { location in
            XCTAssertEqual(location.latitude, dummyLocation.coordinate.latitude)
            XCTAssertEqual(location.longitude, dummyLocation.coordinate.longitude)
            expectation.fulfill()
        }
        locationManager.locationManager(locationManager.manager, didUpdateLocations: [dummyLocation])
        
        waitForExpectations(timeout: 1)
    }
    
    func testLocationRequest() {
        let expectation = expectation(description: "Location requested")
        
        locationManager.requestLocation()
        sleep(5)
        expectation.fulfill()

        waitForExpectations(timeout: 10)
    }
}
