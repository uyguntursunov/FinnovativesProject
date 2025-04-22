//
//  CompanyDataService.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 21/04/25.
//

import Foundation
import Combine

class CompanyDataService {
    
    @Published var allCompanies: [CompanyModel] = []
    
    var companySubscribtion: AnyCancellable?
    
    init() {
        getCompanies()
    }
    
    //MARK: Get request
    func getCompanies() {
        let companiesURL = "https://67f606e7913986b16fa65016.mockapi.io/Businesses"
        guard let url = URL(string: companiesURL) else { return }
        
        companySubscribtion = NetworkManager.download(url: url)
            .decode(type: [CompanyModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedCompanies) in
                self?.allCompanies = returnedCompanies
                self?.companySubscribtion?.cancel()
            })
            
    }
    
    
}

