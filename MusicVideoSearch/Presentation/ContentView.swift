//
//  ContentView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let sceneDIContainer: SceneDIContainer
    let searchViewModelActions: MusicVideoSearchViewModelActions
    
    var body: some View {
        let viewModel = sceneDIContainer.makeMusicVideoSearchViewModel(actions: searchViewModelActions)
        NavigationStack {
            TabView {
                MusicVideoSearchView(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                MusicVideoPlayListView(viewModel: sceneDIContainer.makeMusicVideoPlayListViewModel())
                    .tabItem {
                        Image(systemName: "star.fill")
                    }
            }
        }
    }
}

#Preview {
    ContentView(sceneDIContainer: AppDIContainer().makeSceneDIContainer(), searchViewModelActions: .init(showMusicVideoDetail: { musicVideo in
        MusicVideoDetailView(viewModel: DefaultMusicVideoDetailViewModel(playListUseCase: DefaultMusicVideoPlayListUseCase(repository: DefaultMusicVideoRepository(musicVideoStorage: DefaultMusicVideoStorage())), artistName: musicVideo.artistName, trackName: musicVideo.trackName, artworkUrl100: musicVideo.artworkUrl100, primaryGenreName: musicVideo.primaryGenreName))
    }))
}
