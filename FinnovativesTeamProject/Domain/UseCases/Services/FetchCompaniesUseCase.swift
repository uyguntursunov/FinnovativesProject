//
//  FetchCompaniesUseCase.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol FetchCompaniesUseCaseProtocol {
    func execute(_ completion: @escaping ([CompanyEntity]) -> Void)
}

final class FetchCompaniesUseCase: FetchCompaniesUseCaseProtocol {
    let companyRepository: CompanyRepositoryProtocol
    
    init(companyRepository: CompanyRepositoryProtocol = CompanyRepository()) {
        self.companyRepository = companyRepository
    }
    
    func execute(_ completion: @escaping ([CompanyEntity]) -> Void) {
        companyRepository.fetchCompanies { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(NetworkManagerErrorMessage.fetchCompaniesError + error.localizedDescription)
            }
        }
    }
}
