//
//  ContentView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    let sceneDIContainer: SceneDIContainer
    
    var body: some View {
        let viewModel = sceneDIContainer.makeMusicVideoSearchViewModel()
        NavigationStack {
            TabView {
                MusicVideoSearchView(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                MusicVideoBookmarkView()
                    .tabItem {
                        Image(systemName: "star.fill")
                    }
            }
        }
    }
}

#Preview {
    ContentView(sceneDIContainer: AppDIContainer().makeSceneDIContainer())
}
