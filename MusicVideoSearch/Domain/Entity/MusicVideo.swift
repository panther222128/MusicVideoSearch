//
//  MusicVideo.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

struct MusicVideos {
    let resultCount: Int
    let results: [MusicVideo]
}

struct MusicVideo {
    let artistName, trackName: String
    let artworkUrl100: String
    let primaryGenreName: String
}

