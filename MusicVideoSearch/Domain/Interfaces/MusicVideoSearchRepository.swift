//
//  MusicVideoSearchRepository.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation
import Combine

protocol MusicVideoSearchRepository {
    func requestMusicVideo(with searchQuery: MusicVideoQuery, limit: Int, offset: Int, entity: String) throws -> AnyPublisher<MusicVideos, Error>
}
