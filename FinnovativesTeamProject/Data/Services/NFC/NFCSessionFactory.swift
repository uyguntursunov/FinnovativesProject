//
//  NFCSessionFactory.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 25/04/25.
//

import CoreNFC

protocol NFCNDEFReaderSessionProtocol {
    var alertMessage: String { get set }
    func begin()
    func invalidate()
}

extension NFCNDEFReaderSession: NFCNDEFReaderSessionProtocol {}

protocol NFCSessionFactoryProtocol {
    func createSession(delegate: NFCNDEFReaderSessionDelegate) -> NFCNDEFReaderSessionProtocol
}

final class NFCSessionFactory: NFCSessionFactoryProtocol {
    func createSession(delegate: NFCNDEFReaderSessionDelegate) -> NFCNDEFReaderSessionProtocol {
        return NFCNDEFReaderSession(delegate: delegate, queue: nil, invalidateAfterFirstRead: false)
    }
}
