//
//  ViewFlowCoordinator.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/27/23.
//

import Foundation

protocol MusicVideoSearchFlowCoordinatorDependencies {
    func makeMusicVideoDetailView(musicVideo: MusicVideo) -> MusicVideoDetailView
}

final class ViewFlowCoordinator {
    
    private let dependencies: MusicVideoSearchFlowCoordinatorDependencies
    private let sceneDIContainer: SceneDIContainer
    
    init(dependencies: MusicVideoSearchFlowCoordinatorDependencies, sceneDIContainer: SceneDIContainer) {
        self.dependencies = dependencies
        self.sceneDIContainer = sceneDIContainer
    }
    
    func start() -> ContentView {
        return ContentView(flow: self)
    }
    
    func makeMusicVideoSearchView() -> MusicVideoSearchView {
        let actions = MusicVideoSearchActions(showMusicVideoDetail: showMusicVideoDetail(musicVideo:))
        return sceneDIContainer.makeMusicVideoSearchView(actions: actions)
    }
    
    func makeMusicVideoDetailView(musicVideo: MusicVideo) -> MusicVideoDetailView {
        return sceneDIContainer.makeMusicVideoDetailView(musicVideo: musicVideo)
    }
    
    private func showMusicVideoDetail(musicVideo: MusicVideo) -> MusicVideoDetailView {
        return sceneDIContainer.makeMusicVideoDetailView(musicVideo: musicVideo)
    }
    
}
