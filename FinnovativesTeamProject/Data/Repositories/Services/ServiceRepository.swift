//
//  ServiceRepository.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

final class ServiceRepository: ServiceRepositoryProtocol {
    func fetchServices(_ completion: @escaping ([ServiceEntity]) -> Void) {
        let services = ServiceType.allCases.map { type in
            ServiceEntity(
                imageString: type.imageString,
                title: type.title,
                subtitle: type.subtitle,
                type: type
            )
        }
        
        completion(services)
    }
}
