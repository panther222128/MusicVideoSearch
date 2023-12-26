//
//  MusicVideoResponseDTO.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/22/23.
//

import Foundation

struct MusicVideosResponseDTO: Decodable {
    let resultCount: Int
    let results: [MusicVideoResponseDTO]
    
    private enum CodingKeys: String, CodingKey {
        case resultCount
        case results
    }
}

struct MusicVideoResponseDTO: Decodable {
    let artistName, trackName: String
    let artworkUrl100: String
    let primaryGenreName: String

    private enum CodingKeys: String, CodingKey {
        case artistName, trackName
        case artworkUrl100, primaryGenreName
    }
}

extension MusicVideosResponseDTO {
    func toDomain() -> MusicVideos {
        return .init(resultCount: resultCount, results: results.map { $0.toDomain() })
    }
}

extension MusicVideoResponseDTO {
    func toDomain() -> MusicVideo {
        return .init(artistName: artistName, trackName: trackName, artworkUrl100: artworkUrl100, primaryGenreName: primaryGenreName)
    }
}
