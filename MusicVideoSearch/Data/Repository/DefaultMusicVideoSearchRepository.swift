//
//  DefaultMusicVideoSearchRepository.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import Foundation
import Combine

final class DefaultMusicVideoSearchRepository: MusicVideoSearchRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
    func requestMusicVideo(with searchQuery: MusicVideoQuery, limit: Int, offset: Int, entity: String) throws -> AnyPublisher<MusicVideos, Error> {
        let requestDTO = MusicVideoRequestDTO(term: searchQuery.query, limit: limit, offset: offset, entity: entity)
        let endpoint = APIEndpoints.getMusicVideo(with: requestDTO)
        do {
            return try dataTransferService.request(with: endpoint)
                .tryMap() { data in
                    return data.toDomain()
                }
                .eraseToAnyPublisher()
        } catch let error {
            throw error
        }
    }
    
    func requestMusicVideo(with searchQuery: MusicVideoQuery, limit: Int, offset: Int, entity: String) async throws -> MusicVideos {
        let requestDTO = MusicVideoRequestDTO(term: searchQuery.query, limit: limit, offset: offset, entity: entity)
        let endpoint = APIEndpoints.getMusicVideo(with: requestDTO)
        do {
            return try await dataTransferService.request(with: endpoint).toDomain()
        } catch let error {
            throw error
        }
    }
    
}
