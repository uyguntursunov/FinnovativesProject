//
//  OrderRequestUiTileMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol OrderRequestUiTileMapperProtocol {
    func map(_ orderRequest: OrderRequestUiTile) -> OrderRequestEntity
}

final class OrderRequestUiTileMapper: OrderRequestUiTileMapperProtocol {
    func map(_ orderRequest: OrderRequestUiTile) -> OrderRequestEntity {
        let entity = OrderRequestEntity(comapnyName: orderRequest.comapnyName,
                                        companyPhone: orderRequest.companyPhone,
                                        numberOfNFCStickers: orderRequest.numberOfNFCStickers,
                                        companyID: orderRequest.companyID)
        
        return entity
    }
}
