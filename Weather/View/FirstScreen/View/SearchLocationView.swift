//
//  SearchLocationView.swift
//  Weather
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import SwiftUI

struct SearchLocationView: View {
    @ObservedObject var viewModel: FirstScreenViewModel
    
    var body: some View {
        HStack {
            let color: Color = viewModel.isDay ? .black : .white
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(color)
                    .padding(.horizontal, -5)
                
                TextField("", text: $viewModel.cityName, prompt: Text("Search for city").foregroundColor(color.opacity(0.4)))
                    .foregroundColor(color)
                    .onSubmit {
                        viewModel.loadCityData()
                    }
                
                Button(action: {viewModel.cityName = ""}) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(color.opacity(viewModel.cityName.isEmpty ? 0 : 1))
                        .padding(.horizontal, -5)
                }
            }
            .padding(.horizontal)
            .frame(height: 35)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .shadow(radius: 4)
            )
            
            
            Button(action: viewModel.locationManager.requestLocation) {
                Image(systemName: "location.fill")
                    .foregroundColor(color)
                    .frame(width: 35, height: 35)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.ultraThinMaterial)
                            .shadow(radius: 4)
                    )
            }
        }
        .padding()
    }
}

#Preview {
    SearchLocationView(viewModel: FirstScreenViewModel())
}
