//
//  ServiceProviderViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class CompaniesViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var allCompanies: [CompanyUiTile] = []
    
    let fetchCompaniesUseCase: FetchCompaniesUseCaseProtocol
    let companyUiTileMapper: CompanyUiTileMapperProtocol
    
    init(fetchCompaniesUseCase: FetchCompaniesUseCaseProtocol = FetchCompaniesUseCase(),
         companyUiTileMapper: CompanyUiTileMapperProtocol = CompanyUiTileMapper()) {
        self.fetchCompaniesUseCase = fetchCompaniesUseCase
        self.companyUiTileMapper = companyUiTileMapper
        getCompanies()
    }
    
    var filteredServiceProviders: [CompanyUiTile] {
        if searchText.isEmpty {
            return allCompanies
        } else {
            return allCompanies.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func getCompanies() {
        fetchCompaniesUseCase.execute { [weak self] companies in
            DispatchQueue.main.async {
                if let companies = self?.companyUiTileMapper.map(companies) {
                    self?.allCompanies = companies
                }
            }
        }
    }
}
