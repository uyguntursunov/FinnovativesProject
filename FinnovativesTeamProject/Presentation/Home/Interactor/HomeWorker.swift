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
    
    private var session: NFCNDEFReaderSession?
    private var completion: ((HomeModels.ScanNFC.Response) -> Void)?
    
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
        guard NFCNDEFReaderSession.readingAvailable else {
            completion(HomeModels.ScanNFC.Response(urlString: nil, error: NFCError.scanningNotSupported))
            return
        }
        
        self.completion = completion
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        session?.alertMessage = "Hold your iPhone near Payme tag to make payment."
        session?.begin()
    }
}

// MARK: - NFCNDEFReaderSessionDelegate

extension HomeWorker: NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        DispatchQueue.main.async {
            for message in messages {
                for record in message.records {
                    if record.typeNameFormat == .nfcWellKnown, record.type == Data("U".utf8) {
                        guard !record.payload.isEmpty else { continue }
                        let payload = record.payload.dropFirst()
                        if let urlString = String(data: payload, encoding: .utf8) {
                            self.completion?(HomeModels.ScanNFC.Response(urlString: urlString, error: nil))
                            session.invalidate()
                            return
                        }
                    }
                }
            }
            session.invalidate()
        }
    }
    
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) { }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        if let readerError = error as? NFCReaderError,
           readerError.code != .readerSessionInvalidationErrorFirstNDEFTagRead &&
            readerError.code != .readerSessionInvalidationErrorUserCanceled {
            self.completion?(HomeModels.ScanNFC.Response(urlString: nil, error: error))
        }
        self.session = nil
    }
}

