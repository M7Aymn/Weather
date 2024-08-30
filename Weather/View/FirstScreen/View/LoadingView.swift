//
//  LoadingView.swift
//  Weather
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                ProgressView()
                    .scaleEffect(2)
                    .frame(height: 75)
                    .tint(.white)
                Text("loading")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    LoadingView()
}
