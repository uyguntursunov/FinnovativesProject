//
//  ServiceProviderViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class ServiceProviderViewModel: ObservableObject {
    @Published var serviceProviders: [ServiceProvider] = [
        ServiceProvider(name: "EVOS", logo: "evosLogo"),
        ServiceProvider(name: "Korzinka", logo: "korzinkaLogo"),
        ServiceProvider(name: "Oqtepa Lavash", logo: "oqtepaLogo"),
        ServiceProvider(name: "Makro", logo: "makroLogo"),
        ServiceProvider(name: "Cambridge", logo: "cambridgeLogo"),
        ServiceProvider(name: "Street 77", logo: "street77Logo"),
        ServiceProvider(name: "Belissimo", logo: "belissimoLogo"),
    ]
    
    @Published var searchText: String = ""
    
    var filteredServiceProviders: [ServiceProvider] {
        if searchText.isEmpty {
            return serviceProviders
        } else {
            return serviceProviders.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
