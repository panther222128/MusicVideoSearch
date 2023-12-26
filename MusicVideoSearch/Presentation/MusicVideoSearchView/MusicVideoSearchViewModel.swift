//
//  MusicVideoSearchViewModel.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import Foundation
import Combine

enum MusicVideosError: Error {
    case isEmpty
    case loadError
}

protocol MusicVideoSearchViewModel: ObservableObject {
    var items: [MusicVideoItemViewModel] { get }
    var isErrorOccured: Bool { get set }
    var error: Error? { get }
    
    func didSearch(with query: String)
}

final class DefaultMusicVideoSearchViewModel: MusicVideoSearchViewModel {
    
    @Published var items: [MusicVideoItemViewModel]
    @Published var isErrorOccured: Bool
    @Published var error: Error?
    private var musicVideos: MusicVideos
    private var cancellables: Set<AnyCancellable>
    private let limit: Int
    private let offset: Int
    private let entity: String
    private let useCase: MusicVideoSearchUseCase
    
    init(useCase: MusicVideoSearchUseCase, limit: Int = 20, offset: Int = 0, entity: String = "musicVideo") {
        self.useCase = useCase
        self.items = []
        self.musicVideos = .init(resultCount: 0, results: [])
        self.cancellables = []
        self.limit = limit
        self.offset = offset
        self.entity = entity
        self.isErrorOccured = false
        self.error = nil
    }
    
    private func load(_ musicVideos: MusicVideos) {
        self.musicVideos = musicVideos
        items = self.musicVideos.results.map { MusicVideoItemViewModel(musicVideo: $0) }
    }
    
    private func load(with musicVideoQuery: MusicVideoQuery) {
        do {
            try useCase.executeRequest(with: SearchMusicVideoUseCaseRequestValue(query: .init(query: musicVideoQuery.query), limit: limit, offset: offset, entity: entity))
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        return
                        
                    case .failure(let error):
                        self?.isErrorOccured = true
                        self?.error = error
                        
                    }
                } receiveValue: { [weak self] musicVideos in
                    if musicVideos.resultCount == 0 || musicVideos.results.isEmpty {
                        self?.isErrorOccured = true
                        self?.error = MusicVideosError.isEmpty
                    } else {
                        self?.load(musicVideos)
                    }
                }
                .store(in: &cancellables)

        } catch {
            self.isErrorOccured = true
            self.error = MusicVideosError.loadError
        }
    }
    
    func didSearch(with query: String) {
        guard !query.isEmpty else { return }
        load(with: MusicVideoQuery(query: query))
    }
    
}
