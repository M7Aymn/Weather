//
//  HourView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct HourView: View {
    let hour: Current
    let localTime: String
    
    var body: some View {
        if let currentTime = DateFormat.timeIn12HoursOrNow(from: hour.time ?? "2024-08-30 00:00", localTime: localTime) {
            HStack(alignment: .center) {
                Text(currentTime)
                    .frame(width: 110, alignment: .leading)
                IconView(urlString: "https:" + hour.condition.icon, length: 80, vPadding: -25, hPadding: -25)
                Text(String(format: "%.0f°", hour.tempC))
                    .frame(width: 110, alignment: .trailing)
            }
            .font(.largeTitle)
        } else {
            EmptyView()
        }
    }
}

#Preview {
    HourView(hour: dummyWeather.forecast.forecastday[2].hour[21], localTime: dummyWeather.location.localtime)
}
