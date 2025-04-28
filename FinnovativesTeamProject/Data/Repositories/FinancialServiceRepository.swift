//
//  FinancialServiceRepository.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 26/04/25.
//

import Foundation

protocol FinancialServiceRepositoryProtocol {
    func fetchFinancialServices(_ completion: @escaping (Result<[FinancialServiceEntity], Error>) -> Void)
}

final class FinancialServiceRepository: FinancialServiceRepositoryProtocol {
    private let financialServices: [FinancialServiceEntity] = [
        FinancialServiceEntity(title: "transferFunds".localized, image: .service),
        FinancialServiceEntity(title: "tbcLoan".localized, image: .service)
    ]
    
    func fetchFinancialServices(_ completion: @escaping (Result<[FinancialServiceEntity], any Error>) -> Void) {
        completion(.success(financialServices))
    }
}
