//
//  VideoPlayerContainerView..swift
//  staj
//
//  Created by Bilgesu Barış on 23.07.2025.
//

import SwiftUI
import AVFoundation

struct VideoPlayerContainerView: UIViewRepresentable {
    let player: AVPlayer

    class PlayerUIView: UIView {
        private var playerLayer: AVPlayerLayer?

        override func layoutSubviews() {
            super.layoutSubviews()
            playerLayer?.frame = bounds
        }

        func configure(player: AVPlayer) {
            playerLayer?.removeFromSuperlayer()
            let layer = AVPlayerLayer(player: player)
            layer.videoGravity = .resizeAspectFill
            layer.frame = bounds
            self.layer.addSublayer(layer)
            self.playerLayer = layer
        }
    }

    func makeUIView(context: Context) -> PlayerUIView {
        let view = PlayerUIView()
        view.configure(player: player)
        return view
    }

    func updateUIView(_ uiView: PlayerUIView, context: Context) {
        uiView.configure(player: player)
    }
}
