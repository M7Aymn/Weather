//
//  HourView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct HourView: View {
    let hour: Current
    var body: some View {
        HStack(alignment: .center) {
            Text(DateFormat.timeIn12HourFormat(from: hour.time ?? "2024-08-22 00:00"))
                .frame(width: 125, alignment: .leading)
            ConditionImage(urlString: "https:" + hour.condition.icon, length: 90, vPadding: -25, hPadding: -30)
            Text(String(format: "%.1f°", hour.tempC))
                .frame(width: 125, alignment: .trailing)
        }
        .font(.largeTitle)
    }
}

#Preview {
    HourView(hour: dummyWeather.forecast.forecastday[0].hour[14])
}
