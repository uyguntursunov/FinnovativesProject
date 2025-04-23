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
    let nfcService: NFCServiceProtocol
    
    init(nfcService: NFCServiceProtocol) {
        self.nfcService = nfcService
    }
    
    private var events: [EventModel] = [
        EventModel(image: .event),
        EventModel(image: .event),
        EventModel(image: .event),
        EventModel(image: .event)
    ]
    
    private var financialServices: [FinancialServiceModel] = [
        FinancialServiceModel(title: "Transfer funds", image: .service),
        FinancialServiceModel(title: "Loan from TBC Bank", image: .service)
    ]
    
    private var paymentForServices: [PaymentForServiceModel] = [
        PaymentForServiceModel(title: "Популярное", image: SFSymbols.listClipboard),
        PaymentForServiceModel(title: "Мобильные операторы", image: SFSymbols.iphone),
        PaymentForServiceModel(title: "Интернет-провайдеры", image: SFSymbols.network),
        PaymentForServiceModel(title: "Коммунальные услуги", image: SFSymbols.bolt),
        PaymentForServiceModel(title: "Госуслуги и штрафы ГУБДД", image: SFSymbols.buildingColumns),
        PaymentForServiceModel(title: "Телефония", image: SFSymbols.phone),
        PaymentForServiceModel(title: "Телевидение и онлайн-вещание", image: SFSymbols.tv),
        PaymentForServiceModel(title: "Благотворительность", image: SFSymbols.heart)
    ]
}

// MARK: - HomeWorkerProtocol

extension HomeWorker: HomeWorkerProtocol {
    func fetchContent(
        request: HomeModels.FetchContent.Request,
        completion: @escaping (Result<HomeModels.FetchContent.Response, any Error>) -> Void
    ) {
        completion(.success(HomeModels.FetchContent.Response(events: events, financialServices: financialServices, paymentForServices: paymentForServices)))
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

