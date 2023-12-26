//
//  MusicVideoDetailView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import SwiftUI

struct MusicVideoDetailView: View {
    let viewModel: MusicVideoDetailViewModel
    
    var body: some View {
        VStack {
            if let imageUrl = URL(string: viewModel.artworkUrl100) {
                AsyncImage(url: imageUrl)
            }
            HStack {
                Text(viewModel.trackName)
                Text("-")
                Text(viewModel.artistName)
            }
        }
    }
}

#Preview {
    MusicVideoDetailView(viewModel: DefaultMusicVideoDetailViewModel(playListUseCase: DefaultMusicVideoPlayListUseCase(repository: DefaultMusicVideoRepository(musicVideoStorage: DefaultMusicVideoStorage())), artistName: "", trackName: "", artworkUrl100: "", primaryGenreName: ""))
}
