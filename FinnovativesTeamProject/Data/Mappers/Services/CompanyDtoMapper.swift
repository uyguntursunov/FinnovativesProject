//
//  CompanyDtoMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol CompanyDtoMapperProtocol {
    func map(_ companies: [CompanyModel]) -> [CompanyEntity]
}

final class CompanyDtoMapper: CompanyDtoMapperProtocol {
    var result: [CompanyEntity] = []
    func map(_ companies: [CompanyModel]) -> [CompanyEntity] {
        for company in companies {
            result.append(CompanyEntity(id: company.id,
                                       name: company.name,
                                       imageUrl: company.imageUrl))
        }
        
        return result
    }
}
