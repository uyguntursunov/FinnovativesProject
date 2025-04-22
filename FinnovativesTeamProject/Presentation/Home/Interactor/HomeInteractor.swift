//
//  HomeInteractor.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 10/04/25.
//


import Foundation

protocol HomeInteractorProtocol {
    func onViewDidLoad()
    func onScanNFC()
}

final class HomeInteractor {
    // MARK: - Dependencies

    private let worker: HomeWorkerProtocol
    private let presentor: HomePresenterProtocol
    
    init(
        worker: HomeWorkerProtocol,
        presentor: HomePresenterProtocol
    ) {
        self.worker = worker
        self.presentor = presentor
    }
}

// MARK: - HomeInteractorProtocol

extension HomeInteractor: HomeInteractorProtocol {
    func onViewDidLoad() {
        worker.fetchContent(request: HomeModels.FetchContent.Request()) { [weak self] result in
            let response: HomeModels.FetchContent.Response
            switch result {
            case .success(let data):
                response = .init(events: data.events, financialServices: data.financialServices, paymentForServices: data.paymentForServices)
            case .failure(let error):
                response = .init(events: [], financialServices: [], paymentForServices: [])
                print("Couldn't fetch home content: \(error.localizedDescription)")
            }
            
            self?.presentor.presentContent(response)
        }
    }
    
    func onScanNFC() {
        worker.scanNFC() { [weak self] result in
            let response = HomeModels.ScanNFC.Response(urlString: result.urlString, error: result.error)
            self?.presentor.presentNFCResult(response)
        }
    }
}
