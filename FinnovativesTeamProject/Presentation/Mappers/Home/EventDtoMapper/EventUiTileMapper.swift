//
//  EventUiTileMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol EventUiTileMapperProtocol {
    func map(_ events: [EventEntity]) -> [EventUiTile]
}

final class EventUiTileMapper: EventUiTileMapperProtocol {
    func map(_ events: [EventEntity]) -> [EventUiTile] {
        var result: [EventUiTile] = []
        for event in events {
            result.append(EventUiTile(image: event.image))
        }
        
        return result
    }
}
