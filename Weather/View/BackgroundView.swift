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
        (isDay ? Image(.day) : Image(.night))
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

#Preview {
    BackgroundView(isDay: true)
}
