//
//  EventRepository.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 26/04/25.
//

import Foundation

final class EventRepository: EventRepositoryProtocol {
    private let events: [EventEntity] = [
        EventEntity(image: .event),
        EventEntity(image: .event),
        EventEntity(image: .event)
    ]
    
    func fetchEvents(_ completion: @escaping (Result<[EventEntity], any Error>) -> Void) {
        completion(.success(events))
    }
}

