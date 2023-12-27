//
//  ViewFlowCoordinator.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/27/23.
//

import Foundation

protocol MusicVideoSearchFlowCoordinatorDependencies {
    func makeMusicVideoSearchView(actions: MusicVideoSearchActions) -> MusicVideoSearchView
    func makeMusicVideoDetailView(musicVideo: MusicVideo) -> MusicVideoDetailView
    func makeMusicVideoPlayListView() -> MusicVideoPlayListView
}

final class ViewFlowCoordinator {
    
    private let dependencies: MusicVideoSearchFlowCoordinatorDependencies
    
    init(dependencies: MusicVideoSearchFlowCoordinatorDependencies) {
        self.dependencies = dependencies
    }
    
    func start() -> ContentView {
        return ContentView(viewFlowCoordinator: self)
    }
    
    func makeMusicVideoSearchView() -> MusicVideoSearchView {
        let actions = MusicVideoSearchActions(showMusicVideoDetail: showMusicVideoDetail(musicVideo:))
        return dependencies.makeMusicVideoSearchView(actions: actions)
    }
    
    private func showMusicVideoDetail(musicVideo: MusicVideo) -> MusicVideoDetailView {
        return dependencies.makeMusicVideoDetailView(musicVideo: musicVideo)
    }
    
    func makeMusicVideoPlayListView() -> MusicVideoPlayListView {
        return dependencies.makeMusicVideoPlayListView()
    }
    
}
