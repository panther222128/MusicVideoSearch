//
//  MusicVideoPlayListUseCase.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/26/23.
//

import Foundation

protocol MusicVideoPlayListUseCase {
    func insert(musicVideo: MusicVideo)
    func delete(musicVideo: MusicVideo)
    func read() -> [MusicVideo]
}

final class DefaultMusicVideoPlayListUseCase: MusicVideoPlayListUseCase {
    
    private let repository: MusicVideoRepository
    
    init(repository: MusicVideoRepository) {
        self.repository = repository
    }
    
    func insert(musicVideo: MusicVideo) {
        repository.insert(musicVideo: musicVideo)
    }
    
    func delete(musicVideo: MusicVideo) {
        repository.delete(musicVideo: musicVideo)
    }
    
    func read() -> [MusicVideo] {
        return repository.read()
    }
    
}
