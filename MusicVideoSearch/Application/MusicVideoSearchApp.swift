//
//  MusicVideoSearchApp.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import SwiftUI

@main
struct MusicVideoSearchApp: App {
    private let appFlowCoordinator: AppFlowCoordinator = {
        let appDIContainer = AppDIContainer()
        let appFlowCoordinator = AppFlowCoordinator(appDIContainer: appDIContainer)
        return appFlowCoordinator
    }()
    
    var body: some Scene {
        WindowGroup {
            appFlowCoordinator.start()
        }
    }
}
