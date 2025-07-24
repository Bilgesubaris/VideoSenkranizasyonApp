//
//  ThreePlayerView..swift
//  staj
//
//  Created by Bilgesu Barış on 23.07.2025.
//

import SwiftUI
import AVFoundation

struct ThreePlayerView: View {
    let player1: AVPlayer
    let player2: AVPlayer
    let player3: AVPlayer

    var body: some View {
        VStack(spacing: 20) {
            Text("Üç Video Senkron Oynatma")
                .font(.largeTitle)
                .bold()

            HStack(spacing: 15) {
                VideoPlayerContainerView(player: player1)
                    .frame(width: 110, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                VideoPlayerContainerView(player: player2)
                    .frame(width: 110, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                VideoPlayerContainerView(player: player3)
                    .frame(width: 110, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Button(action: {
                player1.seek(to: .zero)
                player2.seek(to: .zero)
                player3.seek(to: .zero)
                player1.play()
                player2.play()
                player3.play()
            }) {
                Text("▶️ Senkronize Oynat")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Capsule().fill(Color.purple))
            }

            Spacer()
        }
        .padding()
    }
}
