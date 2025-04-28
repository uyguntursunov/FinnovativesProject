//
//  PaymentForServiceRepository.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 26/04/25.
//

import Foundation

protocol PaymentForServiceRepositoryProtocol {
    func fetchPaymentForServices(_ completion: @escaping (Result<[PaymentForServiceEntity], Error>) -> Void)
}

final class PaymentForServiceRepository: PaymentForServiceRepositoryProtocol {
    private var paymentForServices: [PaymentForServiceEntity] = [
        PaymentForServiceEntity(title: "popular".localized, image: SF.listClipboard),
        PaymentForServiceEntity(title: "mobileOperators".localized, image: SF.iphone),
        PaymentForServiceEntity(title: "internetProviders".localized, image: SF.network),
        PaymentForServiceEntity(title: "communalServices".localized, image: SF.bolt),
        PaymentForServiceEntity(title: "govServices".localized, image: SF.buildingColumns),
        PaymentForServiceEntity(title: "telephony".localized, image: SF.phone),
        PaymentForServiceEntity(title: "tvOnlineBroadcasting".localized, image: SF.tv)
    ]
    
    func fetchPaymentForServices(_ completion: @escaping (Result<[PaymentForServiceEntity], any Error>) -> Void) {
        completion(.success(paymentForServices))
    }
}
