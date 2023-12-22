//
//  MusicVideoSearchView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import SwiftUI

/*
 1. CoreGraphics error
 2. Error handling
 3. Constants URL -> User defined
 */

struct MusicVideoSearchView<ViewModel>: View where ViewModel: MusicVideoSearchViewModel {
    
    @State var query: String = ""
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $query)
                .foregroundStyle(.primary)
        }
        .onSubmit {
            viewModel.didSearch(with: query)
        }
        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
        .foregroundStyle(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10.0)
        
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(viewModel.items) { item in
                    HStack {
                        if let url = URL(string: item.artworkUrl100) {
                            AsyncImage(url: url)
                        }
                        Text(item.artistName)
                        Text("-")
                        Text(item.trackName)
                        Spacer()
                    }
                }
            }
        }
        
        Spacer()
    }
    
}

// MARK: - MusicVideoSearchView
#Preview {
    ContentView(sceneDIContainer: AppDIContainer().makeSceneDIContainer())
}
