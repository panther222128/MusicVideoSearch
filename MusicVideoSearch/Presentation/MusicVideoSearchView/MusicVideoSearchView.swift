//
//  MusicVideoSearchView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import SwiftUI

struct MusicVideoSearchView<ViewModel>: View where ViewModel: MusicVideoSearchViewModel {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.items) { item in
                Text(item.artist)
            }
        }
    }
    
}

// MARK: - MusicVideoSearchView
#Preview {
    ContentView(sceneDIContainer: AppDIContainer().makeSceneDIContainer())
}
