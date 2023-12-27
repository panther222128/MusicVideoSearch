//
//  SceneDIContainer.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

final class SceneDIContainer: MusicVideoSearchFlowCoordinatorDependencies {
    
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
    
    func makeMusicVideoSearchView(actions: MusicVideoSearchActions) -> MusicVideoSearchView {
        return MusicVideoSearchView(useCase: makeMusicVideoSearchUseCase(), actions: actions)
    }
    
    func makeMusicVideoDetailView(musicVideo: MusicVideo) -> MusicVideoDetailView {
        return MusicVideoDetailView(musicVideo: musicVideo)
    }
    
    func makeMusicVideoSearchCoordinator(with sceneDIContainer: SceneDIContainer) -> ViewFlowCoordinator {
        return ViewFlowCoordinator(dependencies: self, sceneDIContainer: sceneDIContainer)
    }
    
}
