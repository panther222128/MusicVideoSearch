//
//  ViewFlowCoordinator.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

protocol ViewFlowCoordinatorDependencies {
    
}

final class ViewFlowCoordinator {
    
    private let dependencies: ViewFlowCoordinatorDependencies
    
    init(dependencies: ViewFlowCoordinatorDependencies) {
        self.dependencies = dependencies
    }
    
    func start(with sceneDIContainer: SceneDIContainer) -> ContentView {
        return ContentView(sceneDIContainer: sceneDIContainer)
    }
    
}
