//
//  OrderRequestMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol OrderRequestMapperProtocol {
    func map(_ request: OrderRequestEntity) -> OrderRequestModel
}

final class OrderRequestMapper: OrderRequestMapperProtocol {
    func map(_ request: OrderRequestEntity) -> OrderRequestModel {
        let result = OrderRequestModel(comapnyName: request.comapnyName,
                                       companyPhone: request.companyPhone,
                                       numberOfNFCStickers: request.numberOfNFCStickers,
                                       companyID: request.companyID)
        
        return result
    }
}
