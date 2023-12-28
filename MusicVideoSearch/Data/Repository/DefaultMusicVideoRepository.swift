//
//  DefaultMusicVideoRepository.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/28/23.
//

import SwiftData

final class DefaultMusicVideoRepository: MusicVideoRepository {
    
    private let storage: MusicVideoStorage
    
    init(storage: MusicVideoStorage) {
        self.storage = storage
    }
    
    func read(using modelContext: ModelContext) throws -> [MusicVideo] {
        do {
            let entities = try storage.read(using: modelContext)
            let domain = entities.map { $0.toDomain() }
            return domain
        } catch let error {
            throw error
        }
    }
    
    func insert(musicVideo: MusicVideo, using modelContext: ModelContext) {
        storage.insert(musicVideo: musicVideo, using: modelContext)
    }
    
    func delete(musicVideo: MusicVideo, using modelContext: ModelContext) {
        storage.delete(musicVideoEntity: .init(id: musicVideo.id, artistName: musicVideo.artistName, trackName: musicVideo.trackName, artworkUrl100: musicVideo.artworkUrl100, primaryGenreName: musicVideo.primaryGenreName), using: modelContext)
    }
    
}
