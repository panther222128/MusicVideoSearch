//
//  ContentView.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import SwiftUI
import SwiftData

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
    
    init(flow: ViewFlowCoordinator) {
        self.viewFlowCoordinator = flow
    }
    
}

#Preview {
    Text("")
}
