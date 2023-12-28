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
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
                viewFlowCoordinator.makeMusicVideoPlayListView()
                    .tabItem {
                        Label("Playlist", systemImage: "star.fill")
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
