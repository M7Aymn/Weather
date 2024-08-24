//
//  DayView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct DayView: View {
    let hours: [Current]
    let isDay: Bool
    let title: String
    
    var body: some View {
        ZStack {
            (isDay ? Image(.day) : Image(.night))
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
                .foregroundStyle(isDay ? .black : .white)
                .frame(width: UIScreen.main.bounds.width)
            }
            
        }
        .navigationTitle(title)
        
    }
}

#Preview {
    //    DayView()
    FirstScreen()
}
