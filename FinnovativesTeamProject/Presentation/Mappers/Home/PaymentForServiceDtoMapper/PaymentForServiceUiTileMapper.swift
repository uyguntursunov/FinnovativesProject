//
//  PaymentForServiceUiTileMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol PaymentForServiceUiTileMapperProtocol {
    func map(_ payForServices: [PaymentForServiceEntity]) -> [PaymentForServiceUiTile]
}

final class PaymentForServiceUiTileMapper: PaymentForServiceUiTileMapperProtocol {
    func map(_ payForServices: [PaymentForServiceEntity]) -> [PaymentForServiceUiTile] {
        var result: [PaymentForServiceUiTile] = []
        for payForService in payForServices {
            result.append(PaymentForServiceUiTile(title: payForService.title,
                                                 image: payForService.image))
        }
        
        return result
    }
}
