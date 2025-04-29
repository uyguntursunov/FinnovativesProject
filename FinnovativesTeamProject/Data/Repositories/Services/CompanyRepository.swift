//
//  CompanyRepository.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

final class CompanyRepository: CompanyRepositoryProtocol {
    let networkManager: NetworkManagerProtocol
    let companyDtoMapper: CompanyDtoMapperProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared,
         companyDtoMapper: CompanyDtoMapperProtocol = CompanyDtoMapper()) {
        self.networkManager = networkManager
        self.companyDtoMapper = companyDtoMapper
    }
    
    func fetchCompanies(_ completion: @escaping (Result<[CompanyEntity], Error>) -> Void) {
        networkManager.getCompanies { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if let data = self?.companyDtoMapper.map(data) {
                        completion(.success(data))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
