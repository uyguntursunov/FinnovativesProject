//
//  PaymentForServiceRepository.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 26/04/25.
//

import Foundation

final class PaymentForServiceRepository: PaymentForServiceRepositoryProtocol {
    private var paymentForServices: [PaymentForServiceEntity] = [
        PaymentForServiceEntity(title: "popular".localized, image: SF.listClipboard),
        PaymentForServiceEntity(title: "mobile_operators".localized, image: SF.iphone),
        PaymentForServiceEntity(title: "internet_providers".localized, image: SF.network),
        PaymentForServiceEntity(title: "communal_services".localized, image: SF.bolt),
        PaymentForServiceEntity(title: "gov_services".localized, image: SF.buildingColumns),
        PaymentForServiceEntity(title: "telephony".localized, image: SF.phone),
        PaymentForServiceEntity(title: "tv_online_broadcasting".localized, image: SF.tv)
    ]
    
    func fetchPaymentForServices(_ completion: @escaping (Result<[PaymentForServiceEntity], any Error>) -> Void) {
        completion(.success(paymentForServices))
    }
}
