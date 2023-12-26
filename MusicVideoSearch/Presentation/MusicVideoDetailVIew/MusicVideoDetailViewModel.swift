//
//  MusicVideoDetailViewModel.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/26/23.
//

import Foundation

struct MusicVideoDetailViewModel: Identifiable {
    let id: UUID
    let artistName: String
    let trackName: String
    let artworkUrl100: String
}
