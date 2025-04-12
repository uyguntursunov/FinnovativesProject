//
//  HomePresenter.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 10/04/25.
//

import Foundation

protocol HomePresenterProtocol {
    func presentContent(_ response: HomeModels.FetchContent.Response)
    func presentNFCResult(_ response: HomeModels.ScanNFC.Response)
}

final class HomePresenter {
    weak var view: HomeViewProtocol?
}

// MARK: - HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    func presentContent(_ response: HomeModels.FetchContent.Response) {
        let viewModel = HomeModels.FetchContent.ViewModel(events: response.events,
                                                          financialServices: response.financialServices,
                                                          paymentForServices: response.paymentForServices)
        view?.displayContent(viewModel)
    }
    
    func presentNFCResult(_ response: HomeModels.ScanNFC.Response) {
        let viewModel = HomeModels.ScanNFC.ViewModel(urlToOpen: response.url,
                                                     errorMessage: response.error?.localizedDescription)
        view?.displayNFCResult(viewModel)
    }
}
