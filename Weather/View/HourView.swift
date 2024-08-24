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
        HStack(alignment: .bottom) {
            Text(DateFormat.timeIn12HourFormat(from: hour.time ?? "2024-08-22 00:00"))
                .font(.title)
                .frame(width: 120, alignment: .leading)
            ConditionImage(urlString: "https:" + hour.condition.icon)
                .frame(width: 80, height: 80)
                .padding(.vertical, -50)
                .padding(.horizontal, -30)
            Text(String(format: "%.1f°", hour.tempC))
                .font(.title)
                .frame(width: 120, alignment: .trailing)
        }
    }
}

#Preview {
    //    HourView()
    FirstScreen()
}
