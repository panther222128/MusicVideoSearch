//
//  MusicVideoRepository.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/26/23.
//

import Foundation

protocol MusicVideoRepository {
    func insert(musicVideo: MusicVideo)
    func delete(musicVideo: MusicVideo)
    func read() -> [MusicVideo]
}
