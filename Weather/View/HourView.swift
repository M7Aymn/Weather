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
        HStack {
            Text(hour.time?.suffix(5) ?? "empty")
                .font(.title)
                .frame(width: 120, alignment: .leading)
            Image(systemName: "cloud.fill")
            Text(String(format: "%.1f°", hour.tempC))
                .font(.title)
                .frame(width: 120, alignment: .trailing)
        }
    }
}

#Preview {
//    HourView()
    ContentView()
}
