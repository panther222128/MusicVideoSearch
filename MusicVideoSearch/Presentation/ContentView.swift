//
//  ContentView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    private let sceneDIContainer: SceneDIContainer
    
    var body: some View {
        NavigationStack {
            TabView {
                sceneDIContainer.makeMusicVideoSearchView(with: sceneDIContainer)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
            }
        }
    }
    
    init(sceneDIContainer: SceneDIContainer) {
        self.sceneDIContainer = sceneDIContainer
    }
}

#Preview {
    ContentView(sceneDIContainer: AppDIContainer().makeSceneDIContainer())
}
