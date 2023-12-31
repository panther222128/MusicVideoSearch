//
//  MusicVideoPlayListView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/27/23.
//

import SwiftUI

struct MusicVideoPlayListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State var musicVideos: [MusicVideo] = []
    @State var isErrorOccured: Bool = false
    @State private var error: Error?
    private let useCase: MusicVideoUseCase
    
    var body: some View {
        VStack {
            List {
                ForEach(musicVideos) { musicVideo in
                    HStack {
                        if let imageUrl = URL(string: musicVideo.artworkUrl100) {
                            AsyncImage(url: imageUrl)
                        }
                        Text(musicVideo.artistName)
                        Text(musicVideo.trackName)
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        deleteMusicVideo(at: index)
                    }
                }
            }
        }
        .alert(isPresented: $isErrorOccured) {
            Alert(title: Text("Error"), message: Text(error?.localizedDescription ?? ""), dismissButton: .cancel())
        }
        .onAppear {
            loadMusicVideo()
        }
    }
    
    init(useCase: MusicVideoUseCase) {
        self.useCase = useCase
        self.error = nil
    }
    
    private func loadMusicVideo() {
        do {
            musicVideos = try useCase.read(using: modelContext)
        } catch {
            
        }
    }
    
    private func deleteMusicVideo(at index: Int) {
        useCase.delete(at: index, using: modelContext)
        loadMusicVideo()
    }
    
}

#Preview {
    Text("")
}
