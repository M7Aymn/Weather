//
//  LocationManager.swift
//  Weather
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import Foundation
import CoreLocation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    var location: CLLocationCoordinate2D? {
        didSet {
            if let location = location {
                locationUpdated?(location)
            }
        }
    }
    var locationUpdated: ((CLLocationCoordinate2D) -> Void)?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
//        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
