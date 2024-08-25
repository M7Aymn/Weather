//
//  BackgroundView.swift
//  Weather
//
//  Created by Mohamed Ayman on 25/08/2024.
//

import SwiftUI

struct BackgroundView: View {
    let isDay: Bool
    
    var body: some View {
        VStack {
            (isDay ? Image(.day) : Image(.night))
                .resizable()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    BackgroundView(isDay: true)
}
