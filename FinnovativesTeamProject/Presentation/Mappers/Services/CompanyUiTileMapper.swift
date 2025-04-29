//
//  CompanyUiTileMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol CompanyUiTileMapperProtocol {
    func map(_ companies: [CompanyEntity]) -> [CompanyUiTile]
}

final class CompanyUiTileMapper: CompanyUiTileMapperProtocol {
    var result: [CompanyUiTile] = []
    func map(_ companies: [CompanyEntity]) -> [CompanyUiTile] {
        for company in companies {
            result.append(CompanyUiTile(id: company.id,
                                        name: company.name,
                                        imageUrl: company.imageUrl))
        }
        
        return result
    }
}
