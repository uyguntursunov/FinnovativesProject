//
//  NFCServiceTests.swift
//  FinnovativesTeamProjectTests
//
//  Created by Uygun Tursunov on 25/04/25.
//

// NFCServiceTests.swift

import XCTest
import CoreNFC
@testable import FinnovativesTeamProject

final class MockSession: NFCNDEFReaderSessionProtocol {
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

final class MockFactory: NFCSessionFactoryProtocol {
    let mockSession = MockSession()

    func createSession(delegate: NFCNDEFReaderSessionDelegate) -> NFCNDEFReaderSessionProtocol {
        return mockSession
    }
}

final class NFCServiceTests: XCTestCase {
    func test_scanNFC_whenNFCIsNotAvailable_returnsScanningNotSupportedError() {
        let factory = MockFactory()
        let service = NFCService(factory: factory)

        let expectation = self.expectation(description: "Completion called")
        service.scanNFC { result in
            if case .failure(let error) = result {
                XCTAssertEqual(error as? NFCError, NFCError.scanningNotSupported)
            } else {
                XCTFail("Expected scanningNotSupported error, but received success.")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }
}


