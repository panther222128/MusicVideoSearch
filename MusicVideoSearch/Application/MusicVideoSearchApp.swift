//
//  MusicVideoSearchApp.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import SwiftUI

@main
struct MusicVideoSearchApp: App {
    private let appDIContainer: AppDIContainer = AppDIContainer()
    
    var body: some Scene {
        WindowGroup {
            let sceneDIContainer = appDIContainer.makeSceneDIContainer()
            ContentView(sceneDIContainer: sceneDIContainer)
        }
    }
}
