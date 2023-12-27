//
//  APIEndpoints.swift
//  MusicVideoSearch
//
//  Created by Horus on 12/22/23.
//

import Foundation

struct APIEndpoints {
    
    static func getMusicVideo(with musicVideoRequestDTO: MusicVideoRequestDTO) -> Endpoint<MusicVideosResponseDTO> {
        return Endpoint(path: "search", queryParametersEncodable: musicVideoRequestDTO, method: .get)
    }
    
}
