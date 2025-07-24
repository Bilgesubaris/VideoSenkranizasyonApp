//
//   DropView.swift
//  staj
//
//  Created by Bilgesu Barış on 23.07.2025.
//
import SwiftUI
import AVFoundation

struct DropView: View {
    var title: String
    var player: AVPlayer?
    var onDropVideo: (String) -> Void

    @State private var pulse = false

    var body: some View {
        ZStack {
            if let player = player {
                VideoPlayerContainerView(player: player)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 5)
            } else {
                VStack(spacing: 12) {
                    Image(systemName: "video.badge.plus")
                        .font(.system(size: 54))
                        .foregroundColor(.gray.opacity(0.7))
                        .scaleEffect(pulse ? 1.1 : 1.0)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: pulse)
                        .onAppear { pulse = true }

                    Text(title)
                        .font(.headline)
                        .foregroundColor(.gray.opacity(0.7))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 22)
                        .fill(.ultraThinMaterial)
                        .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 4)
                )
            }
        }
        .onDrop(of: [.text], isTargeted: nil) { providers in
            if let provider = providers.first {
                _ = provider.loadObject(ofClass: NSString.self) { (item, error) in
                    if let name = item as? String {
                        DispatchQueue.main.async {
                            onDropVideo(name)
                        }
                    }
                }
                return true
            }
            return false
        }
        .animation(.easeInOut, value: player)
    }
}


