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
                .blur(radius: 2, opaque: true)
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    BackgroundView(isDay: true)
}
