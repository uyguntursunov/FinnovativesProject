//
//  ServiceViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class ServiceViewModel: ObservableObject {
    @Published private(set) var services: [ServiceUiTile] = []
    
    private let fetchServicesUseCase: FetchServicesUseCaseProtocol
    private let serviceDtoMapper: ServiceUiTileMapperProtocol
    
    init(fetchServicesUseCase: FetchServicesUseCaseProtocol = FetchServicesUseCase(),
         serviceDtoMapper: ServiceUiTileMapperProtocol = ServiceUiTileMapper()) {
        self.fetchServicesUseCase = fetchServicesUseCase
        self.serviceDtoMapper = serviceDtoMapper
        fetchServices()
    }
    
    private func fetchServices() {
        fetchServicesUseCase.execute { [weak self] services in
            if let services = self?.serviceDtoMapper.map(services) {
                self?.services = services
            }
        }
    }
}
