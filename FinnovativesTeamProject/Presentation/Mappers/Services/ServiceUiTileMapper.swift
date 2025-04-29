//
//  ServiceUiTileMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol ServiceUiTileMapperProtocol {
    func map(_ services: [ServiceEntity]) -> [ServiceUiTile]
}

final class ServiceUiTileMapper: ServiceUiTileMapperProtocol {
    var result: [ServiceUiTile] = []
    func map(_ services: [ServiceEntity]) -> [ServiceUiTile] {
        for service in services {
            result.append(ServiceUiTile(imageString: service.imageString,
                                       title: service.title,
                                       subtitle: service.subtitle,
                                       type: service.type))
        }
        
        return result
    }
}
