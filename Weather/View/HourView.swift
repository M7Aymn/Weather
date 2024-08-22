//
//  HourView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct HourView: View {
    var body: some View {
        HStack {
            Text("Now")
                .font(.title)
                .frame(width: 120, alignment: .leading)
            Image(systemName: "cloud.fill")
            Text("15°")
                .font(.title)
                .frame(width: 80, alignment: .trailing)
        }
    }
}

#Preview {
    HourView()
}
