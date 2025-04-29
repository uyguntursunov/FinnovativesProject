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
    private let fetchContentUseCaseFactory: FetchContentUseCaseFactoryProtocol
    private let contentDtoMapperFactory: ContentUiTileMapperFactoryProtocol
    private let scanNFCUseCase: ScanNFCUseCaseProtocol
    private var events: [EventUiTile] = []
    private var financialServices: [FinancialServiceUiTile] = []
    private var paymentForServices: [PaymentForServiceUiTile] = []
    
    init(
        fetchContentUseCaseFactory: FetchContentUseCaseFactoryProtocol = FetchContentUseCaseFactory(),
        contentMapperFactory: ContentUiTileMapperFactoryProtocol = ContentUiTileMapperFactory(),
        scanNFCUseCase: ScanNFCUseCaseProtocol = ScanNFCUseCase()
    ) {
        self.fetchContentUseCaseFactory = fetchContentUseCaseFactory
        self.contentDtoMapperFactory = contentMapperFactory
        self.scanNFCUseCase = scanNFCUseCase
    }
}

// MARK: - HomeWorkerProtocol

extension HomeWorker: HomeWorkerProtocol {
    func fetchContent(
        request: HomeModels.FetchContent.Request,
        completion: @escaping (Result<HomeModels.FetchContent.Response, any Error>) -> Void
    ) {
        fetchContentUseCaseFactory.createFetchEventsUseCase().execute { [weak self] entities in
            if let events = self?.contentDtoMapperFactory.createEventDtoMapper().map(entities) {
                self?.events = events
            }
        }
        
        fetchContentUseCaseFactory.createFetchFinancialServicesUseCase().execute { [weak self] entities in
            if let financialServices = self?.contentDtoMapperFactory.createFinancialServiceDtoMapper().map(entities) {
                self?.financialServices = financialServices
            }
        }
        
        fetchContentUseCaseFactory.createFetchPaymentForServicesUseCase().execute { [weak self] entities in
            if let payForServices = self?.contentDtoMapperFactory.createPaymentForServiceDtoMapper().map(entities) {
                self?.paymentForServices = payForServices
            }
        }
        
        completion(.success(HomeModels.FetchContent.Response(events: events,
                                                             financialServices: financialServices,
                                                             paymentForServices: paymentForServices)))
    }
    
    func scanNFC(completion: @escaping (HomeModels.ScanNFC.Response) -> Void) {
        scanNFCUseCase.execute { result in
            switch result {
            case .success(let data):
                completion(.init(urlToOpen: data, error: nil))
            case .failure(let error):
                completion(.init(urlToOpen: nil, error: error))
            }
        }
    }
}

