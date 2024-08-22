//
//  ConditionImage.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct ConditionImage: View {
    let urlString: String
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .scaleEffect(1.2)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    ConditionImage(urlString: "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg")
        .frame(width: 200, height: 200)
}
