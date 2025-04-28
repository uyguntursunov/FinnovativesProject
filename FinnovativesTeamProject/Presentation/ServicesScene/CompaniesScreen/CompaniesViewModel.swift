//
//  ServiceProviderViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class CompaniesViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var allCompanies: [CompanyModel] = []
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
        getCompanies()
    }
    
    var filteredServiceProviders: [CompanyModel] {
        if searchText.isEmpty {
            return allCompanies
        } else {
            return allCompanies.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func getCompanies() {
        networkManager.getCompanies { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.allCompanies = data
                }
            case .failure(let error):
                print("Couldn't fetch companies from Network", error.localizedDescription)
            }
        }
    }
}
