//
//  MusicVideoSearchView.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/21/23.
//

import SwiftUI
import Combine

struct MusicVideoSearchActions {
    let showMusicVideoDetail: (MusicVideo) -> MusicVideoDetailView
}

struct MusicVideoSearchView: View {
    
    @State var query: String = ""
    @State var musicVideos: [MusicVideo] = []
    private let useCase: MusicVideoSearchUseCase
    private let actions: MusicVideoSearchActions
    private let limit: Int
    private let offset: Int
    private let entity: String
    @State var cancellables: Set<AnyCancellable> = []
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $query)
                    .foregroundStyle(.primary)
            }
            .onSubmit {
                do {
                    try useCase.executeRequest(with: .init(query: .init(query: query), limit: limit, offset: offset, entity: entity))
                        .receive(on: DispatchQueue.main)
                        .sink { completion in
                            switch completion {
                            case .finished:
                                return
                                
                            case .failure(let error):
                                print(error)
                                
                            }
                        } receiveValue: { musicVideos in
                            self.musicVideos = musicVideos.results
                        }
                        .store(in: &cancellables)
                } catch {
                    
                }

            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundStyle(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(musicVideos) { musicVideo in
                        NavigationLink(destination: actions.showMusicVideoDetail(musicVideo)) {
                            HStack {
                                if let url = URL(string: musicVideo.artworkUrl100) {
                                    AsyncImage(url: url)
                                }
                                Text(musicVideo.artistName)
                                    .foregroundStyle(Color.black)
                                Text("-")
                                    .foregroundStyle(Color.black)
                                Text(musicVideo.trackName)
                                    .foregroundStyle(Color.black)
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }
    
    init(useCase: MusicVideoSearchUseCase, actions: MusicVideoSearchActions, limit: Int = 20, offset: Int = 0, entity: String = "musicVideo") {
        self.useCase = useCase
        self.actions = actions
        self.limit = limit
        self.offset = offset
        self.entity = entity
    }
    
}

// MARK: - MusicVideoSearchView
#Preview {
    Text("")
}
