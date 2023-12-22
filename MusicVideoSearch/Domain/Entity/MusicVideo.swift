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
    let wrapperType, kind: String
    let artistID, trackID: Int
    let artistName, trackName, trackCensoredName: String
    let artistViewURL, trackViewURL: String
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice: Double?
    let trackPrice: Double?
    let releaseDate: String
    let collectionExplicitness, trackExplicitness: String
    let trackTimeMillis: Int?
    let country, currency, primaryGenreName: String
}

