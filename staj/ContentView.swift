import SwiftUI
import AVFoundation
import AVKit
struct ContentView: View {
    let videoNames = ["test", "test2"]

    @State private var selectedVideo1: String? = nil
    @State private var selectedVideo2: String? = nil
    @State private var player1: AVPlayer? = nil
    @State private var player2: AVPlayer? = nil

    @State private var player3: AVPlayer? = nil
    @State private var showVideoPicker = false
    @State private var pickedVideoURL: URL? = nil
    @State private var showThreePlayerView = false

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.blue.opacity(0.4), Color.purple.opacity(0.4)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 30) {
                        Spacer().frame(height: 40)

                        Text("🎞️ Video Stüdyosu")
                            .font(.system(size: 36, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(radius: 6)

                        Text("Videoya dokunup seçin ya da sürükleyip alana bırakın.")
                            .font(.headline)
                            .foregroundColor(Color.white.opacity(0.8))

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(videoNames, id: \.self) { name in
                                    if let url = Bundle.main.url(forResource: name, withExtension: "mp4") {
                                        let previewPlayer = AVPlayer(url: url)
                                        Button(action: {
                                            if selectedVideo1 == nil {
                                                selectedVideo1 = name
                                                player1 = AVPlayer(url: url)
                                            } else if selectedVideo2 == nil {
                                                selectedVideo2 = name
                                                player2 = AVPlayer(url: url)
                                            }
                                        }) {
                                            VideoPlayer(player: previewPlayer)
                                                .frame(width: 160, height: 90)
                                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                        }
                                        .onDrag { NSItemProvider(object: name as NSString) }
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }

                        VStack(spacing: 30) {
                            DropView(title: "🎬 Alan 1", player: player1) { name in
                                if let url = Bundle.main.url(forResource: name, withExtension: "mp4") {
                                    selectedVideo1 = name
                                    player1 = AVPlayer(url: url)
                                }
                            }
                            .frame(height: 260)

                            DropView(title: "📽️ Alan 2", player: player2) { name in
                                if let url = Bundle.main.url(forResource: name, withExtension: "mp4") {
                                    selectedVideo2 = name
                                    player2 = AVPlayer(url: url)
                                }
                            }
                            .frame(height: 260)
                        }

                        if let p1 = player1, let p2 = player2 {
                            Button(action: {
                                p1.seek(to: .zero)
                                p2.seek(to: .zero)
                                p1.play()
                                p2.play()
                            }) {
                                Text("▶️ Senkronize Oynat")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Capsule().fill(Color.purple))
                            }
                        }

                        Button(action: {
                            showVideoPicker = true
                        }) {
                            Text("📁 Galeriden Video Seç")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Capsule().fill(Color.blue))
                        }

                        if let p1 = player1, let p2 = player2, let p3 = player3 {
                            NavigationLink(destination: ThreePlayerView(player1: p1, player2: p2, player3: p3),
                                           isActive: $showThreePlayerView) {
                                EmptyView()
                            }
                        }
                    }
                }
                .navigationBarHidden(true)

                if showVideoPicker {
                    VideoPicker(videoURL: $pickedVideoURL) { url in
                        if let url = url {
                            player3 = AVPlayer(url: url)
                            DispatchQueue.main.async {
                                showThreePlayerView = true
                            }
                        }
                        showVideoPicker = false
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
}

// #Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
