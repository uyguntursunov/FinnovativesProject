//
//  ServiceViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class ServiceViewModel: ObservableObject {
    @Published private(set) var services: [ServiceModel] = []
    
    private let fetchServicesUseCase: FetchServicesUseCaseProtocol
    private let serviceDTOMapper: ServiceDTOMapperProtocol
    
    init(fetchServicesUseCase: FetchServicesUseCaseProtocol = FetchServicesUseCase(),
         serviceDTOMapper: ServiceDTOMapperProtocol = ServiceDTOMapper()) {
        self.fetchServicesUseCase = fetchServicesUseCase
        self.serviceDTOMapper = serviceDTOMapper
        fetchServices()
    }
    
    private func fetchServices() {
        fetchServicesUseCase.execute { [weak self] services in
            if let services = self?.serviceDTOMapper.map(services) {
                self?.services = services
            }
        }
    }
}
