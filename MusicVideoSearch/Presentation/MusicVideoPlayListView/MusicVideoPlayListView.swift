//
//  MusicVideoPlayListView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/26/23.
//

import SwiftUI

struct MusicVideoPlayListView: View {
    
    let viewModel: MusicVideoPlayListViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MusicVideoPlayListView(viewModel: DefaultMusicVideoPlayListViewModel(playListUseCase: DefaultMusicVideoPlayListUseCase(repository: DefaultMusicVideoRepository(musicVideoStorage: DefaultMusicVideoStorage()))))
}
