//
//  ServiceProviderViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation
import Combine

class ServiceProviderViewModel: ObservableObject {
//    @Published var serviceProviders: [ServiceProvider] = [
//        ServiceProvider(name: "EVOS", logo: "evosLogo"),
//        ServiceProvider(name: "Korzinka", logo: "korzinkaLogo"),
//        ServiceProvider(name: "Oqtepa Lavash", logo: "oqtepaLogo"),
//        ServiceProvider(name: "Makro", logo: "makroLogo"),
//        ServiceProvider(name: "Cambridge", logo: "cambridgeLogo"),
//        ServiceProvider(name: "Street 77", logo: "street77Logo"),
//        ServiceProvider(name: "Belissimo", logo: "belissimoLogo"),
//    ]
    
    @Published var searchText: String = ""
    
    @Published var companies: [CompanyModel] = []
    
    private let networkManager = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        networkManager.$companies
            .sink { [weak self] (returnedCompanies) in
                self?.companies = returnedCompanies
            }
            .store(in: &cancellables)
    }
    
    var filteredServiceProviders: [CompanyModel] {
        if searchText.isEmpty {
            return companies
        } else {
            return companies.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
