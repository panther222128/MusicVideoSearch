//
//  MusicVideoSearchViewModel.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation
import Combine

protocol MusicVideoSearchViewModel {
    var items: [MusicVideoItemViewModel] { get }
}

final class DefaultMusicVideoSearchViewModel: MusicVideoSearchViewModel {
    
    @Published var items: [MusicVideoItemViewModel] = []
    
    private let useCase: MusicVideoSearchUseCase
    
    init(useCase: MusicVideoSearchUseCase) {
        self.useCase = useCase
    }
    
}
