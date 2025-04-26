//
//  HomeWorker.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 10/04/25.
//

import Foundation
import CoreNFC

protocol HomeWorkerProtocol {
    func fetchContent(
        request: HomeModels.FetchContent.Request,
        completion: @escaping (Result<HomeModels.FetchContent.Response, Error>) -> Void
    )
    
    func scanNFC(completion: @escaping (HomeModels.ScanNFC.Response) -> Void)
}

final class HomeWorker: NSObject {
    private let fetchEventsUseCase: FetchEventsUseCaseProtocol
    private let fetchFinancialServicesUseCase: FetchFinancialServicesUseCaseProtocol
    private let fetchPaymentForServicesUseCase: FetchPaymentForServicesUseCaseProtocol
    private let nfcService: NFCServiceProtocol
    private var events: [EventModel] = []
    private var financialServices: [FinancialServiceModel] = []
    private var paymentForServices: [PaymentForServiceModel] = []
    
    init(
        fetchEventsUseCase: FetchEventsUseCaseProtocol = FetchEventsUseCase(),
        fetchFinancialServicesUseCase: FetchFinancialServicesUseCaseProtocol = FetchFinancialServicesUseCase(),
        fetchPaymentForServicesUseCase: FetchPaymentForServicesUseCaseProtocol = FetchPaymentForServicesUseCase(),
        nfcService: NFCServiceProtocol
    ) {
        self.fetchEventsUseCase = fetchEventsUseCase
        self.fetchFinancialServicesUseCase = fetchFinancialServicesUseCase
        self.fetchPaymentForServicesUseCase = fetchPaymentForServicesUseCase
        self.nfcService = nfcService
    }
}

// MARK: - HomeWorkerProtocol

extension HomeWorker: HomeWorkerProtocol {
    func fetchContent(
        request: HomeModels.FetchContent.Request,
        completion: @escaping (Result<HomeModels.FetchContent.Response, any Error>) -> Void
    ) {
        fetchEventsUseCase.execute { [weak self] entities in
            for entity in entities {
                self?.events.append(EventModel(image: entity.image))
            }
        }
        
        fetchFinancialServicesUseCase.execute { [weak self] entities in
            for entity in entities {
                self?.financialServices.append(FinancialServiceModel(title: entity.title,
                                                                     image: entity.image))
            }
        }
        
        fetchPaymentForServicesUseCase.execute { [weak self] entities in
            for entity in entities {
                self?.paymentForServices.append(PaymentForServiceModel(title: entity.title,
                                                                       image: entity.image))
            }
        }
        
        completion(.success(HomeModels.FetchContent.Response(events: events,
                                                             financialServices: financialServices,
                                                             paymentForServices: paymentForServices)))
    }
    
    func scanNFC(completion: @escaping (HomeModels.ScanNFC.Response) -> Void) {
        nfcService.scanNFC { result in
            switch result {
            case .success(let data):
                completion(.init(urlToOpen: data, error: nil))
            case .failure(let error):
                completion(.init(urlToOpen: nil, error: error))
            }
        }
    }
}

