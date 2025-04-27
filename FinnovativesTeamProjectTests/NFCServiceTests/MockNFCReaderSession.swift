//
//  MockNFCReaderSession.swift
//  FinnovativesTeamProjectTests
//
//  Created by Uygun Tursunov on 27/04/25.
//

import XCTest
import CoreNFC
@testable import FinnovativesTeamProject

final class MockNFCReaderSession: NFCNDEFReaderSessionProtocol {
    var alertMessage: String = "Hold your iPhone near Payme tag to make payment."
    var didBegin = false
    var didInvalidate = false

    func begin() {
        didBegin = true
    }

    func invalidate() {
        didInvalidate = true
    }
}

final class MockNFCReaderSessionFactory: NFCSessionFactoryProtocol {
    var mockSession = MockNFCReaderSession()

    func createSession(delegate: NFCNDEFReaderSessionDelegate) -> NFCNDEFReaderSessionProtocol {
        return mockSession
    }
}
