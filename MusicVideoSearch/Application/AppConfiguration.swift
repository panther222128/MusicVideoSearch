//
//  AppConfiguration.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation

final class AppConfiguration {
    lazy var apiBaseURL: String = {
        guard let url = Constants.BaseURL.url else {
            fatalError("URL Error")
        }
        return url.absoluteString
    }()
}
