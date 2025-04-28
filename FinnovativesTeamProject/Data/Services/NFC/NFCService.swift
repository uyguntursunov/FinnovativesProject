//
//  NFCService.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 22/04/25.
//

import Foundation
import CoreNFC

protocol NFCServiceProtocol {
    func scanNFC(completion: @escaping (Result<URL, Error>) -> Void)
}

final class NFCService: NSObject {
    private var session: NFCNDEFReaderSessionProtocol?
    private let sessionFactory: NFCSessionFactoryProtocol
    private var completion: ((Result<URL, Error>) -> Void)?
    
    init(factory: NFCSessionFactoryProtocol = NFCSessionFactory()) {
        self.sessionFactory = factory
    }
}

// MARK: - NFCServiceProtocol

extension NFCService: NFCServiceProtocol {
    func scanNFC(completion: @escaping (Result<URL, Error>) -> Void) {
        guard NFCNDEFReaderSession.readingAvailable else {
            completion(.failure(NFCError.scanningNotSupported))
            return
        }
        
        self.completion = completion
        session = sessionFactory.createSession(delegate: self)
        session?.alertMessage = "nfcAlertMessage".localized
        session?.begin()
    }
}

// MARK: - NFCNDEFReaderSessionDelegate

extension NFCService: NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        DispatchQueue.main.async {
            for message in messages {
                for record in message.records {
                    if record.typeNameFormat == .nfcWellKnown, record.type == Data("U".utf8) {
                        guard !record.payload.isEmpty else { continue }
                        let payload = record.payload.dropFirst()
                        if let urlString = String(data: payload, encoding: .utf8),
                           let url = URL(string: ["https://", urlString].joined()) {
                            self.completion?(.success(url))
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
            self.completion?(.failure(error))
        }
        self.session = nil
    }
}
