//
//  MusicVideoSearchUseCase.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import Foundation
import Combine

protocol MusicVideoSearchUseCase {
    func executeRequest(with requestValue: SearchMusicVideoUseCaseRequestValue) throws -> AnyPublisher<MusicVideos, Error>
    func executeRequest(with requestValue: SearchMusicVideoUseCaseRequestValue) async throws -> MusicVideos
}

final class DefaultMusicVideoSearchUseCase: MusicVideoSearchUseCase {
    
    private let repository: MusicVideoSearchRepository
    
    init(repository: MusicVideoSearchRepository) {
        self.repository = repository
    }
    
    func executeRequest(with requestValue: SearchMusicVideoUseCaseRequestValue) throws -> AnyPublisher<MusicVideos, Error> {
        do {
            return try repository.requestMusicVideo(with: requestValue.query, limit: requestValue.limit, offset: requestValue.offset, entity: requestValue.entity)
                .eraseToAnyPublisher()
        } catch let error {
            throw error
        }
    }
    
    func executeRequest(with requestValue: SearchMusicVideoUseCaseRequestValue) async throws -> MusicVideos {
        do {
            return try await repository.requestMusicVideo(with: requestValue.query, limit: requestValue.limit, offset: requestValue.offset, entity: requestValue.entity)
        } catch let error {
            throw error
        }
    }
    
}

struct SearchMusicVideoUseCaseRequestValue {
    let query: MusicVideoQuery
    let limit: Int
    let offset: Int
    let entity: String
}
