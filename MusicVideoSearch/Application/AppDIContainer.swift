//
//  AppDIContainer.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
    lazy var apiDataTransferService: DataTransferService = {
        let configuration = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.apiBaseURL)!)
        let apiDataNetwork = DefaultNetworkService(configuration: configuration)
        return DefaultDataTransferService(networkService: apiDataNetwork)
    }()
    
    func makeSceneDIContainer() -> SceneDIContainer {
        let dependencies = SceneDIContainer.Dependencies(apiDataTransferService: apiDataTransferService)
        return SceneDIContainer(dependencies: dependencies)
    }
    
}
