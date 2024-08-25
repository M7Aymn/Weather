//
//  CurrentConditions.swift
//  Weather
//
//  Created by Mohamed Ayman on 24/08/2024.
//

import SwiftUI

struct CurrentConditions: View {
    let current: Current
    
    var body: some View {
        HStack(spacing: 30) {
            Spacer()
            
            VStack(spacing: 5) {
                SingleCondition(title: "VISIBILITY", value: "\(current.visKM) Km")
                SingleCondition(title: "FEELS LIKE", value: String(format: "%.1f°", current.feelslikeC))
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                SingleCondition(title: "HUMIDITY", value: "\(current.humidity)%")
                SingleCondition(title: "PRESSURE", value: "\(current.pressureMB)")
            }
            
            Spacer()
        }
    }
}

struct SingleCondition: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
            Text(value)
                .font(.title)
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    CurrentConditions(current: dummyWeather.current)
}
