//
//  MusicVideoSearchApp.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import SwiftUI
import SwiftData

@main
struct MusicVideoSearchApp: App {
    private let modelContainer: ModelContainer = {
        do {
            return try ModelContainer(for: MusicVideoEntity.self)
        } catch {
            fatalError("Model container generation failed")
        }
    }()
    
    private let appFlowCoordinator: AppFlowCoordinator = {
        let appDIContainer = AppDIContainer()
        let appFlowCoordinator = AppFlowCoordinator(appDIContainer: appDIContainer)
        return appFlowCoordinator
    }()
    
    var body: some Scene {
        WindowGroup {
            appFlowCoordinator.start()
                .modelContainer(modelContainer)
        }
    }
}
