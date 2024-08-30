//
//  HourView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct HourView: View {
    let viewModel: SecondScreenViewModel
    let index: Int
    
    var body: some View {
        if let currentTime = viewModel.getCurrentTime(index: index) {
            HStack(alignment: .center) {
                Text(currentTime)
                    .frame(width: 110, alignment: .leading)
                IconView(urlString: "https:" + viewModel.hours[index].condition.icon, length: 80, vPadding: -25, hPadding: -25)
                Text(String(format: "%.0f°", viewModel.hours[index].tempC))
                    .frame(width: 110, alignment: .trailing)
            }
            .font(.largeTitle)
        } else {
            EmptyView()
        }
    }
}

//#Preview {
//    HourView(hour: dummyWeather.forecast.forecastday[2].hour[21], localTime: dummyWeather.location.localtime)
//}
