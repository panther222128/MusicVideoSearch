//
//  ContentView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
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
