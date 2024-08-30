//
//  ForecastView.swift
//  Weather
//
//  Created by Mohamed Ayman on 24/08/2024.
//

import SwiftUI

struct ForecastView: View {
    @ObservedObject var viewModel: FirstScreenViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("3-DAY FORECAST")
                .font(.subheadline)
            
            ForEach(viewModel.weather!.forecast.forecastday, id: \.date) { forecastDay in
                Rectangle().frame(height: 1)
                
                let (dayName, dayNameShort) = viewModel.getDayName(for: forecastDay)
                
                NavigationLink {
                    let secondVM = viewModel.prepareForSecondScreen(forecastDay: forecastDay, title: dayName)
                    SecondScreenView(viewModel: secondVM)
                } label: {
                    HStack {
                        Text(dayNameShort)
                            .frame(width: 120, alignment: .leading)
                        IconView(urlString: "https:" + forecastDay.day.condition.icon, length: 50, vPadding: -2, hPadding: -10)
                        Text(String(format: "%.1f° - %.1f°", forecastDay.day.mintempC, forecastDay.day.maxtempC)
                        )
                        .frame(width: 120, alignment: .trailing)
                    }
                }
            }
        }
        .font(.title3)
        .frame(width: 290)
    }
}

#Preview {
    ForecastView(viewModel: FirstScreenViewModel())
        .foregroundStyle(.black)
}
