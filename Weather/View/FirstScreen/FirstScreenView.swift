//
//  FirstScreenView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct FirstScreenView: View {
    @State private var weather: WeatherModel?
    @State private var isDay = false
    @State private var cityName = ""
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        
        if let weather = weather {
            NavigationStack {
                ZStack {
                    BackgroundView(isDay: isDay)
                    
                    ScrollView {
                        
                        VStack {
                                                        
                            HStack {
                                let color: Color = isDay ? .black : .white
                                
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(color)
                                        .padding(.horizontal, -5)
                                    
                                    TextField("", text: $cityName, prompt: Text("Search for city").foregroundColor(color.opacity(0.4)))
                                        .foregroundColor(color)
                                        .onSubmit {
                                            loadWeatherData(for: cityName)
                                            cityName = ""
                                        }
                                    
                                    Button(action: {cityName = ""}) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(color.opacity(cityName.isEmpty ? 0 : 1))
                                            .padding(.horizontal, -5)
                                    }
                                }
                                .padding(.horizontal)
                                .frame(height: 35)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.ultraThinMaterial)
                                        .shadow(radius: 4)
                                )
                                
                                
                                Button(action: locationManager.requestLocation) {
                                    Image(systemName: "location.fill")
                                        .foregroundColor(color)
                                        .frame(width: 35, height: 35)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(.ultraThinMaterial)
                                                .shadow(radius: 4)
                                        )
                                }
                            }
                            .padding()
                            
                            Spacer()
                            CurrentView(weather: weather)
                            Spacer()
                            ForecastView(forecastDays: weather.forecast.forecastday, isDay: isDay)
                            Spacer()
                            ConditionsView(current: weather.current)
                            Spacer()
                        }
                        .foregroundStyle(isDay ? .black : .white)
                        .frame(minHeight: UIScreen.main.bounds.height * 0.9)
                    }
                }
                
            }
            .onAppear {
                locationManager.locationUpdated = { location in
                    loadWeatherData(for: "\(location.latitude),\(location.longitude)")
                }
            }
            
        } else {
            LoadingView()
                .task {
                    loadWeatherData(for: "30.0715495,31.0215953")
                }
        }
        
    }
    
    private func loadWeatherData(for city: String) {
        NetworkService.load(search: city) { weather in
            self.cityName = ""
            self.weather = weather
            self.isDay = weather.current.isDay == 1
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D? {
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



#Preview {
    FirstScreenView()
}
