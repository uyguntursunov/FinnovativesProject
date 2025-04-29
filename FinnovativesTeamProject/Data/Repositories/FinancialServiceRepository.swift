//
//  FinancialServiceRepository.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 26/04/25.
//

import Foundation

final class FinancialServiceRepository: FinancialServiceRepositoryProtocol {
    private let financialServices: [FinancialServiceEntity] = [
        FinancialServiceEntity(title: "transfer_funds".localized, image: .service),
        FinancialServiceEntity(title: "tbc_loan".localized, image: .service)
    ]
    
    func fetchFinancialServices(_ completion: @escaping (Result<[FinancialServiceEntity], any Error>) -> Void) {
        completion(.success(financialServices))
    }
}
