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

final class NFCServiceTests: XCTestCase {
    var sut: NFCService!
    var mockSessionFactory: MockNFCReaderSessionFactory!
    var mockSession: MockNFCReaderSession!
    
    override func setUp() {
        super.setUp()
        mockSessionFactory = MockNFCReaderSessionFactory()
        mockSession = mockSessionFactory.mockSession
        sut = NFCService(factory: mockSessionFactory)
    }
    
    override func tearDown() {
        sut = nil
        mockSessionFactory = nil
        mockSession = nil
        super.tearDown()
    }
    
    func test_scanNFC_whenNFCIsNotAvailable_returnsScanningNotSupportedError() {
        // Arrange
        let expectation = self.expectation(description: "Completion called")
        
        // Act
        sut.scanNFC { result in
            if case .failure(let error) = result {
                
                // Assert
                XCTAssertEqual(error as? NFCError, NFCError.scanningNotSupported)
            } else {
                XCTFail("Expected scanningNotSupported error, but received success.")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
    }
}


