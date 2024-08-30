//
//  FirstScreenView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct FirstScreenView: View {
    @ObservedObject private var viewModel: FirstScreenViewModel
    @State private var isVisible = false
    
    init(viewModel: FirstScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        if viewModel.weather != nil {
            NavigationStack {
                ZStack {
                    BackgroundView(isDay: viewModel.isDay)
                    
                    ScrollView {
                        VStack {
                            SearchLocationView(viewModel: viewModel)
                            Spacer()
                            CurrentView(viewModel: viewModel)
                            Spacer()
                            ForecastView(viewModel: viewModel)
                            Spacer()
                            ConditionsView(viewModel: viewModel)
                            Spacer()
                        }
                        .foregroundStyle(viewModel.isDay ? .black : .white)
                        .frame(minHeight: UIScreen.main.bounds.height * 0.9)
                    }
                }
                .opacity(isVisible ? 1 : 0.5)
                .animation(.easeOut(duration: 0.8), value: isVisible)
            }
            .animation(.default, value: viewModel.isDay)
            .onAppear {
                withAnimation {
                    isVisible = true
                }
            }
        } else {
            LoadingView()
                .transition(.opacity)
                .onAppear {
                    viewModel.loadInitialWeatherData()
                }
        }
        
    }
    
}

#Preview {
    FirstScreenView(viewModel: FirstScreenViewModel())
}
