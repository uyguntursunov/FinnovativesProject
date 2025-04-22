//
//  ServiceProviderViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class ServiceProviderViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var allCompanies: [CompanyModel] = []
    
    init() {
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
        API.shared.getCompanies() { [weak self] result in
            switch result {
            case .success(let data):
                self?.allCompanies = data
                case .failure(let error):
                print("Couldn't fetch companies from Network", error.localizedDescription)
            }
        }
    }
}
