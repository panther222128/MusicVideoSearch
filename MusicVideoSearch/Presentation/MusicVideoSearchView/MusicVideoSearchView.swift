//
//  MusicVideoSearchView.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/21/23.
//

import SwiftUI

/*
 1. CoreGraphics error: 'Error: this application, or a library it uses, has passed an invalid numeric value (NaN, or not-a-number) to CoreGraphics API and this value is being ignored. Please fix this problem.'
 */

struct MusicVideoSearchView<ViewModel>: View where ViewModel: MusicVideoSearchViewModel {
    
    @State var query: String = ""
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
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
                        NavigationLink(destination: MusicVideoDetailView(viewModel: .init(id: item.id, artistName: item.artistName, trackName: item.trackName, artworkUrl100: item.artworkUrl100))) {
                            HStack {
                                if let url = URL(string: item.artworkUrl100) {
                                    AsyncImage(url: url)
                                }
                                Text(item.artistName)
                                    .foregroundStyle(Color.black)
                                Text("-")
                                    .foregroundStyle(Color.black)
                                Text(item.trackName)
                                    .foregroundStyle(Color.black)
                                Spacer()
                            }
                        }
                    }
                }
                .alert(isPresented: $viewModel.isErrorOccured) {
                    Alert(title: Text("Error"), message: Text(viewModel.error?.localizedDescription ?? ""), dismissButton: .cancel())
                }
            }
        }
    }
    
}

// MARK: - MusicVideoSearchView
#Preview {
    ContentView(sceneDIContainer: AppDIContainer().makeSceneDIContainer())
}
