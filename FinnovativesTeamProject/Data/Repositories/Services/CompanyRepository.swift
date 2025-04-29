//
//  CompanyRepository.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

final class CompanyRepository: CompanyRepositoryProtocol {
    let networkManager: NetworkManagerProtocol
    let companyDTOMapper: CompanyDTOMapperProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared,
         companyDtoMapper: CompanyDTOMapperProtocol = CompanyDTOMapper()) {
        self.networkManager = networkManager
        self.companyDTOMapper = companyDtoMapper
    }
    
    func fetchCompanies(_ completion: @escaping (Result<[CompanyEntity], Error>) -> Void) {
        networkManager.getCompanies { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if let data = self?.companyDTOMapper.map(data) {
                        completion(.success(data))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
