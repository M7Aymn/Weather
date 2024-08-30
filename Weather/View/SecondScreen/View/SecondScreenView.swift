//
//  SecondScreenView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct SecondScreenView: View {
    let viewModel: SecondScreenViewModel
    
    var body: some View {
        ZStack {
            BackgroundView(isDay: viewModel.isDay)
            
            ScrollView {
                ForEach(viewModel.hours.indices, id: \.self) { index in
                    HourView(viewModel: viewModel, index: index)
                        .padding()
                }
                .padding(.vertical, 30)
                .frame(width: UIScreen.main.bounds.width)
                .foregroundStyle(viewModel.isDay ? .black : .white)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(viewModel.title)
                    .font(.title)
                    .foregroundStyle(viewModel.isDay ? .black : .white)
            }
        }
    }
}

#Preview {
    SecondScreenView(viewModel: SecondScreenViewModel(hours: [], localTime: "", isDay: true, title: ""))
}
