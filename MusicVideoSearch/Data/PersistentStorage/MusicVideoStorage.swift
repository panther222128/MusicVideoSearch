//
//  MusicVideoStorage.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/26/23.
//

import SwiftUI
import SwiftData

protocol MusicVideoStorage {
    func insert(item: MusicVideo)
    func delete(item: MusicVideo)
    func read() -> [MusicVideoEntity]
}

    struct DefaultMusicVideoStorage: MusicVideoStorage {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var musicVideos: [MusicVideoEntity]
    
    func insert(item: MusicVideo) {
        modelContext.insert(MusicVideoEntity(trackName: item.trackName, artistName: item.artistName, artworkUrl100: item.artworkUrl100, primaryGenreName: item.primaryGenreName))
    }
    
    func delete(item: MusicVideo) {
        modelContext.delete(MusicVideoEntity(trackName: item.trackName, artistName: item.artistName, artworkUrl100: item.artworkUrl100, primaryGenreName: item.primaryGenreName))
    }
    
    func read() -> [MusicVideoEntity] {
        return musicVideos
    }
}
