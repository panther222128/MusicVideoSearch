//
//  MusicVideoEntity.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/28/23.
//

import Foundation
import SwiftData

@Model
final class MusicVideoEntity: Identifiable {
    var id: UUID
    var artistName: String
    var trackName: String
    var artworkUrl100: String
    var primaryGenreName: String
    
    init(id: UUID, artistName: String, trackName: String, artworkUrl100: String, primaryGenreName: String) {
        self.id = id
        self.artistName = artistName
        self.trackName = trackName
        self.artworkUrl100 = artworkUrl100
        self.primaryGenreName = primaryGenreName
    }
}

extension MusicVideoEntity {
    func toDomain() -> MusicVideo {
        return .init(id: id, artistName: artistName, trackName: trackName, artworkUrl100: artworkUrl100, primaryGenreName: primaryGenreName)
    }
}
