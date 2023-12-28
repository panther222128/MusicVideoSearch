//
//  NetworkService.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import Foundation
import Combine

enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
    case httpURLResponse
}

protocol NetworkService {
    func request(endpoint: some Requestable) throws -> AnyPublisher<Data, Error>
    func request(endpoint: some Requestable) async throws -> Data
}

final class DefaultNetworkService: NetworkService {
    
    private let configuration: NetworkConfigurable
    private let networkSessionManager: NetworkSessionManager
    
    init(configuration: NetworkConfigurable) {
        self.configuration = configuration
        self.networkSessionManager = DefaultNetworkSessionManager()
    }
    
    func request(endpoint: some Requestable) throws -> AnyPublisher<Data, Error> {
        do {
            let urlRequest = try endpoint.urlRequest(with: configuration)
            return try networkSessionManager.request(urlRequest)
                .tryMap() { data, response in
                    guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.httpURLResponse }
                    if httpResponse.statusCode != 200 {
                        throw NetworkError.error(statusCode: httpResponse.statusCode, data: data)
                    }
                    return data
                }
                .eraseToAnyPublisher()
            
        } catch {
            throw NetworkError.urlGeneration
        }
    }
    
    func request(endpoint: some Requestable) async throws -> Data {
        do {
            let urlRequest = try endpoint.urlRequest(with: configuration)
            let result = try await networkSessionManager.request(urlRequest)
            guard let httpResponse = result.1 as? HTTPURLResponse else { throw NetworkError.httpURLResponse }
            if httpResponse.statusCode != 200 {
                throw NetworkError.error(statusCode: httpResponse.statusCode, data: result.0)
            } else {
                return result.0
            }
        }
    }
    
}

protocol NetworkSessionManager {
    func request(_ request: URLRequest) throws -> URLSession.DataTaskPublisher
    func request(_ request: URLRequest) async throws -> (Data, URLResponse)
}

final class DefaultNetworkSessionManager: NetworkSessionManager {
    
    init() {
        
    }
    
    func request(_ request: URLRequest) throws -> URLSession.DataTaskPublisher {
        guard let url = request.url else { throw NetworkError.urlGeneration }
        return URLSession.shared.dataTaskPublisher(for: url)
    }
    
    func request(_ request: URLRequest) async throws -> (Data, URLResponse) {
        guard let url = request.url else { throw NetworkError.urlGeneration }
        return try await URLSession.shared.data(from: url)
    }
    
}

