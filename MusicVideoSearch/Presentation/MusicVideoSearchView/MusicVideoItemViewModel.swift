//
//  MusicVideoItemViewModel.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

struct MusicVideoItemViewModel: Identifiable {
    let id: UUID
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    let primaryGenreName: String
}

extension MusicVideoItemViewModel {
    init(musicVideo: MusicVideo) {
        self.id = .init()
        self.artistName = musicVideo.artistName
        self.trackName = musicVideo.trackName
        self.artworkUrl100 = musicVideo.artworkUrl100
        self.primaryGenreName = musicVideo.primaryGenreName
    }
}
