//
//  MusicVideoEntity.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/26/23.
//

import Foundation
import SwiftData

@Model
final class MusicVideoEntity {
    var id: UUID
    var trackName: String
    var artistName: String
    var artworkUrl100: String
    var primaryGenreName: String
    
    init(trackName: String, artistName: String, artworkUrl100: String, primaryGenreName: String) {
        self.id = .init()
        self.trackName = trackName
        self.artistName = artistName
        self.artworkUrl100 = artworkUrl100
        self.primaryGenreName = primaryGenreName
    }
}

extension MusicVideoEntity {
    func toDomain() -> MusicVideo {
        return .init(artistName: artistName, trackName: trackName, artworkUrl100: artworkUrl100, primaryGenreName: primaryGenreName)
    }
}
