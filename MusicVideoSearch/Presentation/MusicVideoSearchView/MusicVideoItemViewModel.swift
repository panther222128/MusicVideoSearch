//
//  MusicVideoItemViewModel.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

struct MusicVideoItemViewModel: Identifiable {
    let id: UUID
    let artist: String
}

extension MusicVideoItemViewModel {
    init(musicVideo: MusicVideo) {
        self.id = musicVideo.id
        self.artist = musicVideo.artist
    }
}
