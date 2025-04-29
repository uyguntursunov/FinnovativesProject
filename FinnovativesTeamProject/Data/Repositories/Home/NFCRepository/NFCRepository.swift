//
//  NFCRepository.swift
//  FinnovativesTeamProject
//
//  Created by Uyg'un Tursunov on 30/04/25.
//

import CoreNFC

final class NFCRepository: NSObject {
    private var session: NFCNDEFReaderSessionProtocol?
    private let sessionFactory: NFCSessionFactoryProtocol
    private var completion: ((Result<URL, Error>) -> Void)?
    
    init(factory: NFCSessionFactoryProtocol = NFCSessionFactory()) {
        self.sessionFactory = factory
    }
}

// MARK: - NFCRepositoryPorotocol

extension NFCRepository: NFCRepositoryProtocol {
    func scanNFC(_ completion: @escaping (Result<URL, Error>) -> Void) {
        guard NFCNDEFReaderSession.readingAvailable else {
            completion(.failure(NFCError.scanningNotSupported))
            return
        }
        
        self.completion = completion
        session = sessionFactory.createSession(delegate: self)
        session?.alertMessage = "nfc_alert_message".localized
        session?.begin()
    }
}

// MARK: - NFCNDEFReaderSessionDelegate

extension NFCRepository: NFCNDEFReaderSessionDelegate {
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

