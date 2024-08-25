//
//  SearchLocationView.swift
//  Weather
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import SwiftUI

struct SearchLocationView: View {
    @Binding var cityName: String
    var isDay: Bool
    var locationManager: LocationManager
    var onSearch: (String) -> Void
    
    var body: some View {
        HStack {
            let color: Color = isDay ? .black : .white
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(color)
                    .padding(.horizontal, -5)
                
                TextField("", text: $cityName, prompt: Text("Search for city").foregroundColor(color.opacity(0.4)))
                    .foregroundColor(color)
                    .onSubmit {
                        onSearch(cityName)
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
    }
}

#Preview {
    @State var cityNameDemo: String = ""
    return SearchLocationView(cityName: $cityNameDemo, isDay: true, locationManager: LocationManager(), onSearch: {_ in})
}
