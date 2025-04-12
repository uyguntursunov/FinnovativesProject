//
//  HomeWorker.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 10/04/25.
//

import Foundation

protocol HomeWorkerProtocol {
    func getTotalBalance(
        request: HomeModels.GetTotalBalance.Request,
        completion: @escaping (Result<HomeModels.GetTotalBalance.Response, Error>) -> Void
    )
    
    func fetchContent(
        request: HomeModels.FetchContent.Request,
        completion: @escaping (Result<HomeModels.FetchContent.Response, Error>) -> Void
    )
    
    func scanNFC(
        request: HomeModels.ScanNFC.Request,
        completion: @escaping (Result<HomeModels.ScanNFC.Response, Error>) -> Void
    )
}

final class HomeWorker {
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
    func getTotalBalance(
        request: HomeModels.GetTotalBalance.Request,
        completion: @escaping (Result<HomeModels.GetTotalBalance.Response, any Error>) -> Void
    ) {
        
    }
    
    func fetchContent(
        request: HomeModels.FetchContent.Request,
        completion: @escaping (Result<HomeModels.FetchContent.Response, any Error>) -> Void
    ) {
        completion(.success(HomeModels.FetchContent.Response(events: events, financialServices: financialServices, paymentForServices: paymentForServices)))
    }
    
    func scanNFC(
        request: HomeModels.ScanNFC.Request,
        completion: @escaping (Result<HomeModels.ScanNFC.Response, Error>) -> Void
    ) {
        
    }
}

