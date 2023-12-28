//
//  MusicVideoUseCase.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/28/23.
//

import Foundation
import SwiftData

// MARK: - Bolierplate
protocol MusicVideoUseCase {
    func read(using modelContext: ModelContext) throws -> [MusicVideo]
    func insert(musicVideo: MusicVideo, using modelContext: ModelContext)
    func delete(musicVideo: MusicVideo, using modelContext: ModelContext)
}

final class DefaultMusicVideoUseCase: MusicVideoUseCase {
    
    private let repository: MusicVideoRepository
    
    init(repository: MusicVideoRepository) {
        self.repository = repository
    }
    
    func read(using modelContext: ModelContext) throws -> [MusicVideo] {
        do {
            return try repository.read(using: modelContext)
        } catch let error {
            throw error
        }
    }
    
    func insert(musicVideo: MusicVideo, using modelContext: ModelContext) {
        repository.insert(musicVideo: musicVideo, using: modelContext)
    }
    
    func delete(musicVideo: MusicVideo, using modelContext: ModelContext) {
        repository.delete(musicVideo: musicVideo, using: modelContext)
    }
    
}
