//
//  FetchServicesUseCase.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol FetchServicesUseCaseProtocol {
    func execute(_ completion: @escaping ([ServiceEntity]) -> Void)
}

final class FetchServicesUseCase: FetchServicesUseCaseProtocol {
    let serviceRepository: ServiceRepositoryProtocol
    
    init(serviceRepository: ServiceRepositoryProtocol = ServiceRepository()) {
        self.serviceRepository = serviceRepository
    }
    
    func execute(_ completion: @escaping ([ServiceEntity]) -> Void) {
        serviceRepository.fetchServices { services in
            completion(services)
        }
    }
}
