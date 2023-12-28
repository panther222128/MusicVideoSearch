//
//  DataTransferService.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import Combine
import Foundation

protocol DataTransferService {
    func request<T: Decodable, E: Requestable>(with endpoint: E) throws -> AnyPublisher<T, Error> where E.Response == T
    func request<T: Decodable, E: Requestable>(with endpoint: E) async throws -> T where E.Response == T
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
        } catch let error {
            throw error
        }
    }
    
    func request<T: Decodable, E: Requestable>(with endpoint: E) async throws -> T where E.Response == T {
        do {
            let data = try await networkService.request(endpoint: endpoint)
            let decoded: T = try decode(data: data, using: endpoint.responseDecoder)
            return decoded
        } catch let error {
            throw error
        }
    }
    
    func decode<T: Decodable>(data: Data, using decoder: JSONDecoder) throws -> T {
        return try decoder.decode(T.self, from: data)
    }
    
}
