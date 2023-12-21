//
//  DefaultMusicVideoSearchRepository.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

final class DefaultMusicVideoSearchRepository: MusicVideoSearchRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
}
