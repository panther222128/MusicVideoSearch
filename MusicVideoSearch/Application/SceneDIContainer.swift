//
//  SceneDIContainer.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

final class SceneDIContainer {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    private func makeMusicVideoSearchRepository() -> MusicVideoSearchRepository {
        return DefaultMusicVideoSearchRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    private func makeMusicVideoSearchUseCase() -> MusicVideoSearchUseCase {
        return DefaultMusicVideoSearchUseCase(repository: makeMusicVideoSearchRepository())
    }
    
    func makeMusicVideoSearchView(with sceneDIContainer: SceneDIContainer) -> MusicVideoSearchView {
        return MusicVideoSearchView(useCase: makeMusicVideoSearchUseCase(), sceneDIContainer: sceneDIContainer)
    }
    
    func makeMusicVideoDetailView(musicVideo: MusicVideo) -> MusicVideoDetailView {
        return MusicVideoDetailView(musicVideo: musicVideo)
    }
    
    func makeContentView(with sceneDIContainer: SceneDIContainer) -> ContentView {
        return ContentView(sceneDIContainer: sceneDIContainer)
    }
    
}
