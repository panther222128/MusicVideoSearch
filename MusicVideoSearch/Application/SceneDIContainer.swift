//
//  SceneDIContainer.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import Foundation

final class SceneDIContainer: MusicVideoSearchFlowCoordinatorDependencies {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    private lazy var musicVideoStorage: MusicVideoStorage = DefaultMusicVideoStorage()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    private func makeMusicVideoSearchRepository() -> MusicVideoSearchRepository {
        return DefaultMusicVideoSearchRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    private func makeMusicVideoRepository() -> MusicVideoRepository {
        return DefaultMusicVideoRepository(storage: musicVideoStorage)
    }
    
    private func makeMusicVideoSearchUseCase() -> MusicVideoSearchUseCase {
        return DefaultMusicVideoSearchUseCase(repository: makeMusicVideoSearchRepository())
    }
    
    private func makeMusicVideoUseCase() -> MusicVideoUseCase {
        return DefaultMusicVideoUseCase(repository: makeMusicVideoRepository())
    }
    
    func makeMusicVideoSearchView(actions: MusicVideoSearchActions) -> MusicVideoSearchView {
        return MusicVideoSearchView(useCase: makeMusicVideoSearchUseCase(), actions: actions)
    }
    
    func makeMusicVideoDetailView(musicVideo: MusicVideo) -> MusicVideoDetailView {
        return MusicVideoDetailView(musicVideo: musicVideo, useCase: makeMusicVideoUseCase())
    }
    
    func makeMusicVideoPlayListView() -> MusicVideoPlayListView {
        return MusicVideoPlayListView(useCase: makeMusicVideoUseCase())
    }
    
    func makeMusicVideoSearchCoordinator() -> ViewFlowCoordinator {
        return ViewFlowCoordinator(dependencies: self)
    }
    
}
