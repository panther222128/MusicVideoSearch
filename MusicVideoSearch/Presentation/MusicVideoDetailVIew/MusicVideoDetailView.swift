//
//  MusicVideoDetailView.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import SwiftUI

struct MusicVideoDetailView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var isInserted: Bool = false
    private let musicVideo: MusicVideo
    private let useCase: MusicVideoUseCase
    
    var body: some View {
        VStack {
            Text(musicVideo.primaryGenreName)
            if let imageUrl = URL(string: musicVideo.artworkUrl100) {
                AsyncImage(url: imageUrl)
            }
            HStack {
                Text(musicVideo.trackName)
                Text("-")
                Text(musicVideo.artistName)
            }
            Button {
                
            } label: {
                
            }

        }
    }
    
    init(musicVideo: MusicVideo, useCase: MusicVideoUseCase) {
        self.musicVideo = musicVideo
        self.useCase = useCase
    }
    
}

#Preview {
    Text("")
}
