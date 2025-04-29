//
//  ServiceProviderCardViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 21/04/25.
//

import SwiftUI
import Combine

final class CompanyCellViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let company: CompanyUiTile
    private let imageService: CompanyImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(company: CompanyUiTile) {
        self.company = company
        self.imageService = CompanyImageService(company: company)
        self.addSubscribers()
        self.isLoading = true
    }
    
    func addSubscribers() {
        imageService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
