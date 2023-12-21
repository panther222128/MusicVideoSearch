//
//  AppFlowCoordinator.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

final class AppFlowCoordinator {
    
    private let appDIContainer: AppDIContainer
    
    init(appDIContainer: AppDIContainer) {
        self.appDIContainer = appDIContainer
    }
    
    func start() -> ContentView {
        let sceneDIContainer = appDIContainer.makeSceneDIContainer()
        let flow = sceneDIContainer.makeViewFlowCoordinator()
        return flow.start(with: sceneDIContainer)
    }
    
}
