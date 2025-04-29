//
//  EventDTOMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol EventDTOMapperProtocol {
    func map(_ events: [EventEntity]) -> [EventModel]
}

final class EventDTOMapper: EventDTOMapperProtocol {
    func map(_ events: [EventEntity]) -> [EventModel] {
        var result: [EventModel] = []
        for event in events {
            result.append(EventModel(image: event.image))
        }
        
        return result
    }
}
