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
        PaymentForServiceEntity(title: "Популярное", image: SF.listClipboard),
        PaymentForServiceEntity(title: "Мобильные операторы", image: SF.iphone),
        PaymentForServiceEntity(title: "Интернет-провайдеры", image: SF.network),
        PaymentForServiceEntity(title: "Коммунальные услуги", image: SF.bolt),
        PaymentForServiceEntity(title: "Госуслуги и штрафы ГУБДД", image: SF.buildingColumns),
        PaymentForServiceEntity(title: "Телефония", image: SF.phone),
        PaymentForServiceEntity(title: "Телевидение и онлайн-вещание", image: SF.tv),
        PaymentForServiceEntity(title: "Благотворительность", image: SF.heart)
    ]
    
    func fetchPaymentForServices(_ completion: @escaping (Result<[PaymentForServiceEntity], any Error>) -> Void) {
        completion(.success(paymentForServices))
    }
}
