//
//  MusicVideoSearchRepository.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import Foundation
import Combine

protocol MusicVideoSearchRepository {
    func requestMusicVideo(with searchQuery: MusicVideoQuery, limit: Int, offset: Int, entity: String) throws -> AnyPublisher<MusicVideos, Error>
    func requestMusicVideo(with searchQuery: MusicVideoQuery, limit: Int, offset: Int, entity: String) async throws -> MusicVideos
}
