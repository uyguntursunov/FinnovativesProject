//
//  FetchFinancialServicesUseCase.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 26/04/25.
//

import Foundation

protocol FetchFinancialServicesUseCaseProtocol {
    func execute(_ completion: @escaping ([FinancialServiceEntity]) -> Void)
}

final class FetchFinancialServicesUseCase: FetchFinancialServicesUseCaseProtocol {
    let financialServiceRepository: FinancialServiceRepositoryProtocol
    
    init(
        financialServiceRepository: FinancialServiceRepositoryProtocol = FinancialServiceRepository()
    ) {
        self.financialServiceRepository = financialServiceRepository
    }
    
    func execute(_ completion: @escaping ([FinancialServiceEntity]) -> Void) {
        financialServiceRepository.fetchFinancialServices { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print("Couldn't fetch financial services: \(error.localizedDescription)")
            }
        }
    }
}
