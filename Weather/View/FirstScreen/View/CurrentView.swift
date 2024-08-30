//
//  CurrentView.swift
//  Weather
//
//  Created by Mohamed Ayman on 24/08/2024.
//

import SwiftUI

struct CurrentView: View {
    @ObservedObject var viewModel: FirstScreenViewModel
    
    var body: some View {
        VStack(spacing: -8) {
            Text(viewModel.weather!.location.name)
                .font(.largeTitle.bold())
            Text(String(format: "  %.0f°", viewModel.weather!.current.tempC))
                .font(.system(size: 60).bold())
            Text(viewModel.weather!.current.condition.text)
            Text(
                String(format: " H:%.0f° L:%.0f°", viewModel.weather!.forecast.forecastday[0].day.maxtempC, viewModel.weather!.forecast.forecastday[0].day.mintempC)
            )
            IconView(urlString: "https:" + viewModel.weather!.current.condition.icon, length: 100)
        }
        .font(.title)
    }
}

#Preview {
    CurrentView(viewModel: FirstScreenViewModel())
}
