//
//  MusicVideoPlayListViewModel.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/26/23.
//

import Foundation

protocol MusicVideoPlayListViewModel {
    
}

final class DefaultMusicVideoPlayListViewModel: MusicVideoPlayListViewModel {
    
    private let playListUseCase: MusicVideoPlayListUseCase
    
    init(playListUseCase: MusicVideoPlayListUseCase) {
        self.playListUseCase = playListUseCase
    }
    
}
