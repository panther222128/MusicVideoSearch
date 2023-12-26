//
//  MusicVideoDetailViewModel.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/26/23.
//

import Foundation

protocol MusicVideoDetailViewModel {
    var artistName: String { get }
    var trackName: String { get }
    var artworkUrl100: String { get }
}

final class DefaultMusicVideoDetailViewModel: MusicVideoDetailViewModel {
    
    private let playListUseCase: MusicVideoPlayListUseCase
    private(set) var artistName: String
    private(set) var trackName: String
    private(set) var artworkUrl100: String
    private(set) var primaryGenreName: String
    
    init(playListUseCase: MusicVideoPlayListUseCase, artistName: String, trackName: String, artworkUrl100: String, primaryGenreName: String) {
        self.playListUseCase = playListUseCase
        self.artistName = artistName
        self.trackName = trackName
        self.artworkUrl100 = artworkUrl100
        self.primaryGenreName = primaryGenreName
    }
    
    func insert() {
        playListUseCase.insert(musicVideo: .init(artistName: artistName, trackName: trackName, artworkUrl100: artworkUrl100, primaryGenreName: primaryGenreName))
    }
    
    func delete() {
        playListUseCase.delete(musicVideo: .init(artistName: artistName, trackName: trackName, artworkUrl100: artworkUrl100, primaryGenreName: primaryGenreName))
    }
    
}
