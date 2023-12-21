//
//  SceneDIContainer.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

final class SceneDIContainer: ViewFlowCoordinatorDependencies {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeViewFlowCoordinator() -> ViewFlowCoordinator {
        return ViewFlowCoordinator(dependencies: self)
    }
    
    func makeMusicVideoSearchRepository() -> MusicVideoSearchRepository {
        return DefaultMusicVideoSearchRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    func makeMusicVideoSearchUseCase() -> MusicVideoSearchUseCase {
        return DefaultMusicVideoSearchUseCase(repository: makeMusicVideoSearchRepository())
    }
    
    func makeMusicVideoSearchViewModel() -> MusicVideoSearchViewModel {
        return DefaultMusicVideoSearchViewModel(useCase: makeMusicVideoSearchUseCase())
    }
    
}
