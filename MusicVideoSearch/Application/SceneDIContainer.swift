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
    
    lazy var musicVideoStorage: MusicVideoStorage = DefaultMusicVideoStorage()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeMusicVideoSearchRepository() -> MusicVideoSearchRepository {
        return DefaultMusicVideoSearchRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    func makeMusicVideoRepository() -> MusicVideoRepository {
        return DefaultMusicVideoRepository(musicVideoStorage: musicVideoStorage)
    }
    
    func makeMusicVideoSearchUseCase() -> MusicVideoSearchUseCase {
        return DefaultMusicVideoSearchUseCase(repository: makeMusicVideoSearchRepository())
    }
    
    func makeMusicVideoPlayListUseCase() -> MusicVideoPlayListUseCase {
        return DefaultMusicVideoPlayListUseCase(repository: makeMusicVideoRepository())
    }
    
    func makeMusicVideoSearchViewModel(actions: MusicVideoSearchViewModelActions) -> some MusicVideoSearchViewModel {
        return DefaultMusicVideoSearchViewModel(searchUseCase: makeMusicVideoSearchUseCase(), playListUseCase: makeMusicVideoPlayListUseCase(), actions: actions)
    }
    
    func makeMusicVideoPlayListViewModel() -> some MusicVideoPlayListViewModel {
        return DefaultMusicVideoPlayListViewModel(playListUseCase: makeMusicVideoPlayListUseCase())
    }
    
    func makeMusicVideoDetailViewModel(musicVideo: MusicVideo) -> some MusicVideoDetailViewModel {
        return DefaultMusicVideoDetailViewModel(playListUseCase: makeMusicVideoPlayListUseCase(), artistName: musicVideo.artistName, trackName: musicVideo.trackName, artworkUrl100: musicVideo.artworkUrl100, primaryGenreName: musicVideo.primaryGenreName)
    }
    
    func makeMusicVideoDetailView(musicVideo: MusicVideo) -> MusicVideoDetailView {
        return MusicVideoDetailView(viewModel: makeMusicVideoDetailViewModel(musicVideo: musicVideo))
    }

    func makeViewFlowCoordinator() -> ViewFlowCoordinator {
        return ViewFlowCoordinator(dependencies: self)
    }
    
}
