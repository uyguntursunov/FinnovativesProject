//
//  PaymentForServiceDTOMapper.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol PaymentForServiceDTOMapperProtocol {
    func map(_ payForServices: [PaymentForServiceEntity]) -> [PaymentForServiceModel]
}

final class PaymentForServiceDTOMapper: PaymentForServiceDTOMapperProtocol {
    func map(_ payForServices: [PaymentForServiceEntity]) -> [PaymentForServiceModel] {
        var result: [PaymentForServiceModel] = []
        for payForService in payForServices {
            result.append(PaymentForServiceModel(title: payForService.title,
                                                 image: payForService.image))
        }
        
        return result
    }
}
