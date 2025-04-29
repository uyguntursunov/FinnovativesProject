//
//  FinancialServiceUiTileMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol FinancialServiceUiTileMapperProtocol {
    func map(_ finServices: [FinancialServiceEntity]) -> [FinancialServiceUiTile]
}

final class FinancialServiceUiTileMapper: FinancialServiceUiTileMapperProtocol {
    func map(_ finServices: [FinancialServiceEntity]) -> [FinancialServiceUiTile] {
        var result: [FinancialServiceUiTile] = []
        for finService in finServices {
            result.append(FinancialServiceUiTile(title: finService.title,
                                                image: finService.image))
        }
        
        return result
    }
}
