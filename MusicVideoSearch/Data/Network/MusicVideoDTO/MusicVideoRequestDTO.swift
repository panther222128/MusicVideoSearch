//
//  MusicVideoRequestDTO.swift
//  MusicVideoSearch
//
//  Created by Jun Ho JANG on 12/22/23.
//

import Foundation
struct MusicVideoRequestDTO: Encodable {
    let term: String
    let limit: Int
    let offset: Int
    let entity: String
}
