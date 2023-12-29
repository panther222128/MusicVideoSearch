//
//  MusicVideoRepository.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/28/23.
//

import SwiftData

protocol MusicVideoRepository {
    func read(using modelContext: ModelContext) throws -> [MusicVideo]
    func insert(musicVideo: MusicVideo, using modelContext: ModelContext)
    func delete(at index: Int, using modelContext: ModelContext)
}
