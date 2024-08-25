//
//  IconView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct IconView: View {
    let urlString: String
    let length: CGFloat
    var vPadding: CGFloat = 0
    var hPadding: CGFloat = 0
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .scaleEffect(1.2)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
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
        .frame(width: length, height: length)
        .padding(.vertical, vPadding)
        .padding(.horizontal, hPadding)
    }
}

#Preview {
    IconView(urlString: "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg", length: 200)
        .overlay {
            Circle().stroke()
        }
}
