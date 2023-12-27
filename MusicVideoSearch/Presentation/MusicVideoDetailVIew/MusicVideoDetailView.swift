//
//  MusicVideoDetailView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import SwiftUI

struct MusicVideoDetailView: View {
    private let musicVideo: MusicVideo
    
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
    
    init(musicVideo: MusicVideo) {
        self.musicVideo = musicVideo
    }
}

#Preview {
    MusicVideoDetailView(musicVideo: .init(id: .init(), artistName: "", trackName: "", artworkUrl100: "", primaryGenreName: ""))
}
