//
//  MusicVideoStorage.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/28/23.
//

import Foundation
import SwiftData

enum MusicVideoStorageError: Error {
    case readFail
}

protocol MusicVideoStorage {
    func read(using modelContext: ModelContext) throws -> [MusicVideoEntity]
    func insert(musicVideo: MusicVideo, using modelContext: ModelContext)
    func delete(musicVideoEntity: MusicVideoEntity, using modelContext: ModelContext)
}

final class DefaultMusicVideoStorage: MusicVideoStorage {
    
    init() {
        
    }
    
    func read(using modelContext: ModelContext) throws -> [MusicVideoEntity] {
        do {
            return try modelContext.fetch(FetchDescriptor<MusicVideoEntity>())
        } catch {
            throw MusicVideoStorageError.readFail
        }
    }
    
    func insert(musicVideo: MusicVideo, using modelContext: ModelContext) {
        modelContext.insert(MusicVideoEntity(id: musicVideo.id, artistName: musicVideo.artistName, trackName: musicVideo.trackName, artworkUrl100: musicVideo.artworkUrl100, primaryGenreName: musicVideo.primaryGenreName))
    }
    
    func delete(musicVideoEntity: MusicVideoEntity, using modelContext: ModelContext) {
        modelContext.delete(musicVideoEntity)
    }
    
}
