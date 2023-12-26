//
//  AppConfiguration.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

final class AppConfiguration {
    lazy var apiBaseURL: String = {
        guard let urlString = Bundle.main.infoDictionary?["API_BASE_URL"] as? String else {
            fatalError("URL Error")
        }
        return URL(string: urlString)!.absoluteString
    }()
}
