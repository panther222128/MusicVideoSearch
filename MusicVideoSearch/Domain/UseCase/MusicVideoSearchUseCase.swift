//
//  MusicVideoSearchUseCase.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

protocol MusicVideoSearchUseCase {
    
}

final class DefaultMusicVideoSearchUseCase: MusicVideoSearchUseCase {
    
    private let repository: MusicVideoSearchRepository
    
    init(repository: MusicVideoSearchRepository) {
        self.repository = repository
    }
    
}
