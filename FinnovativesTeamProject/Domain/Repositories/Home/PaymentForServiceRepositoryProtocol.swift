//
//  PaymentForServiceRepositoryProtocol.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol PaymentForServiceRepositoryProtocol {
    func fetchPaymentForServices(_ completion: @escaping (Result<[PaymentForServiceEntity], Error>) -> Void)
}
