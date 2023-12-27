//
//  DataTransferService.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import Combine

enum DataTransferError: Error {
    case noResponse
    case decode
}

protocol DataTransferService {
    func request<T: Decodable, E: Requestable>(with endpoint: E) throws -> AnyPublisher<T, Error> where E.Response == T
}

final class DefaultDataTransferService: DataTransferService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func request<T: Decodable, E: Requestable>(with endpoint: E) throws -> AnyPublisher<T, Error> where E.Response == T {
        do {
            return try networkService.request(endpoint: endpoint)
                .decode(type: T.self, decoder: endpoint.responseDecoder)
                .mapError({ error in
                    return error
                })
                .eraseToAnyPublisher()
        } catch {
            throw DataTransferError.noResponse
        }
    }
    
}
