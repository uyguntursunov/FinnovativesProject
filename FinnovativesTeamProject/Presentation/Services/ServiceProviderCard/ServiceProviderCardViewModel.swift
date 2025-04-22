//
//  ServiceProviderCardViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 21/04/25.
//

import SwiftUI
import Combine

final class ServiceProviderCardViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let company: CompanyModel
    private let dataService: CompanyImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(company: CompanyModel) {
        self.company = company
        self.dataService = CompanyImageService(company: company)
        self.addSubscribers()
        self.isLoading = true
    }
    
    func addSubscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
