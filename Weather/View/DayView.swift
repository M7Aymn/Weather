//
//  DayView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct DayView: View {
    let hours: [Current]
    let isDay: Int
    
    var body: some View {
        ZStack {
            //            Color.green
            //                .ignoresSafeArea()
            (isDay == 1 ? Image(.day) : Image(.night))
            //                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            ScrollView {
                VStack {
                    ForEach(hours, id: \.time) { hour in
                        HourView(hour: hour)
                    }
                    .font(.largeTitle)
                    .padding()
                }
                .padding(.vertical, 50)
                .foregroundStyle(isDay == 1 ? .black : .white)
            }
            
        }
        
    }
}

#Preview {
    //    DayView()
    ContentView()
}
