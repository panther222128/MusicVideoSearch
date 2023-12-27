//
//  ContentView.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    
    private let viewFlowCoordinator: ViewFlowCoordinator
    
    var body: some View {
        NavigationStack {
            TabView {
                viewFlowCoordinator.makeMusicVideoSearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                
                viewFlowCoordinator.makeMusicVideoPlayListView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Playlist")
                    }
            }
        }
    }
    
    init(viewFlowCoordinator: ViewFlowCoordinator) {
        self.viewFlowCoordinator = viewFlowCoordinator
    }
    
}

#Preview {
    Text("")
}
