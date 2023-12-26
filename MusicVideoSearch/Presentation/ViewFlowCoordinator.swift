//
//  ViewFlowCoordinator.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/26/23.
//

import Foundation

protocol MusicVideoSearchFlowCoordinatorDependencies {
    func makeMusicVideoDetailView(musicVideo: MusicVideo) -> MusicVideoDetailView
}

final class ViewFlowCoordinator {
    
    private let dependencies: MusicVideoSearchFlowCoordinatorDependencies
    
    init(dependencies: MusicVideoSearchFlowCoordinatorDependencies) {
        self.dependencies = dependencies
    }
    
    func start(with sceneDIContainer: SceneDIContainer) -> ContentView {
        let actions = MusicVideoSearchViewModelActions(showMusicVideoDetail: showMusicVideoDetail(musicVideo:))
        return ContentView(sceneDIContainer: sceneDIContainer, searchViewModelActions: actions)
    }
    
    func showMusicVideoDetail(musicVideo: MusicVideo) -> MusicVideoDetailView {
        return dependencies.makeMusicVideoDetailView(musicVideo: musicVideo)
    }
    
}
