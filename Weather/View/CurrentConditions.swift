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
                Text("VISIBILITY")
                    .padding(.bottom, 5)
                Text("\(current.visKM) Km")
                    .font(.title)
                    .padding(.bottom, 20)
                
                
                Text("FEELS LIKE")
                    .padding(.bottom, 5)
                
                Text(String(format: "%.1f°", current.feelslikeC))
                    .font(.title)
                    .padding(.bottom, 20)
            }
            .padding(.bottom, 30)
            Spacer()
            
            VStack(spacing: 5) {
                Text("HUMIDITY")
                    .padding(.bottom, 5)
                
                Text("\(current.humidity)%")
                    .font(.title)
                    .padding(.bottom, 20)
                
                Text("PRESSURE")
                    .padding(.bottom, 5)
                
                Text("\(current.pressureMB)")
                    .font(.title)
                    .padding(.bottom, 20)
                
            }
            .padding(.bottom, 30)
            Spacer()
        }
    }
}

#Preview {
//    CurrentConditions()
    FirstScreen()
}
