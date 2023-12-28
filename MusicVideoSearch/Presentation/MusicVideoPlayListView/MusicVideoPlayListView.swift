//
//  MusicVideoPlayListView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/27/23.
//

import SwiftUI

struct MusicVideoPlayListView: View {
    
    @Environment(\.modelContext) private var modelContext
    private let useCase: MusicVideoUseCase
    
    var body: some View {
        Text("Playlist")
    }
    
    init(useCase: MusicVideoUseCase) {
        self.useCase = useCase
    }
    
}

#Preview {
    Text("")
}
