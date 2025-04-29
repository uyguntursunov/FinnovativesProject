//
//  ServiceDTOMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol ServiceDTOMapperProtocol {
    func map(_ services: [ServiceEntity]) -> [ServiceModel]
}

final class ServiceDTOMapper: ServiceDTOMapperProtocol {
    var result: [ServiceModel] = []
    func map(_ services: [ServiceEntity]) -> [ServiceModel] {
        for service in services {
            result.append(ServiceModel(imageString: service.imageString,
                                       title: service.title,
                                       subtitle: service.subtitle,
                                       type: service.type))
        }
        
        return result
    }
}
