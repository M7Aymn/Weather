//
//  DayView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct DayView: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            VStack {
                Group {
                    HourView()
                    HourView()
                    HourView()
                    HourView()
                    HourView()
                }
                .font(.largeTitle)
                .padding()
                
                Spacer()
            }
            
        }
            
    }
}

#Preview {
    DayView()
}
