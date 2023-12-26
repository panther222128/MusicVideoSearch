//
//  DefaultMusicVideoRepository.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/26/23.
//

import Foundation

final class DefaultMusicVideoRepository: MusicVideoRepository {
    
    private let musicVideoStorage: MusicVideoStorage
    
    init(musicVideoStorage: MusicVideoStorage) {
        self.musicVideoStorage = musicVideoStorage
    }
    
    func insert(musicVideo: MusicVideo) {
        musicVideoStorage.insert(item: musicVideo)
    }
    
    func delete(musicVideo: MusicVideo) {
        musicVideoStorage.delete(item: musicVideo)
    }
    
    func read() -> [MusicVideo] {
        let musicVideoEntities = musicVideoStorage.read()
        return musicVideoEntities.map { $0.toDomain() }
    }
    
}
