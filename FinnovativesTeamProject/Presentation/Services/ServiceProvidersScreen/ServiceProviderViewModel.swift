//
//  ServiceProviderViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation
import Combine

class ServiceProviderViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var allCompanies: [CompanyModel] = []
    
    
    private let dataService = CompanyDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        downloadCompanyImage()
    }

    
    func downloadCompanyImage() {
        dataService.$allCompanies
            .sink { [weak self] (returnedCompanies) in
                self?.allCompanies = returnedCompanies
            }
            .store(in: &cancellables)
    }
    
    var filteredServiceProviders: [CompanyModel] {
        if searchText.isEmpty {
            return allCompanies
        } else {
            return allCompanies.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
