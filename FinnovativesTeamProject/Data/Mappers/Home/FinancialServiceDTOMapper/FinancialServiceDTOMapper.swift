//
//  FinancialServiceDTOMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol FinancialServiceDTOMapperProtocol {
    func map(_ finServices: [FinancialServiceEntity]) -> [FinancialServiceModel]
}

final class FinancialServiceDTOMapper: FinancialServiceDTOMapperProtocol {
    func map(_ finServices: [FinancialServiceEntity]) -> [FinancialServiceModel] {
        var result: [FinancialServiceModel] = []
        for finService in finServices {
            result.append(FinancialServiceModel(title: finService.title,
                                                image: finService.image))
        }
        
        return result
    }
}
