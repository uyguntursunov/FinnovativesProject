//
//  FetchEventsUseCase.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 26/04/25.
//

import Foundation

protocol FetchEventsUseCaseProtocol {
    func execute(_ completion: @escaping ([EventEntity]) -> Void)
}

final class FetchEventsUseCase: FetchEventsUseCaseProtocol {
    let eventRepository: EventRepositoryProtocol
    
    init(
        eventRepository: EventRepositoryProtocol = EventRepository()
    ) {
        self.eventRepository = eventRepository
    }
    
    func execute(_ completion: @escaping ([EventEntity]) -> Void) {
        eventRepository.fetchEvents { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(ContentFetchErrorMessage.eventFetchErrorMessage + error.localizedDescription)
            }
        }
    }
}
