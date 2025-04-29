//
//  OrderViewModel_Tests.swift
//  S
//
//  Created by Abdulvoxid on 26/04/25.
//

import XCTest
@testable import FinnovativesTeamProject
final class OrderViewModel_Tests: XCTestCase {
    var sut: OrderViewModel?

    override func setUpWithError() throws {
        sut = OrderViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: Check Textfields are valid or not
    func testIs_TextFieldsValid_Returns_True_For_ValidPhoneNumber_NumberOfStickers() throws {
        // Given
        guard let wrappedSut = sut else {
            XCTFail("OrderViewModel should be initialized")
            return
        }
        
        // When
        let result = wrappedSut.isTextFieldsValid(phoneText: "712007777", numberOfStickers: "50")
        
        // Then
        XCTAssertTrue(result, "Expected true for valid phoneNumber and numberOfStickers")
    }
        
    // MARK: Check warning text visible
    func testShowWarningTextReturnsTrueForInvalidInput() throws {
        // Given
        guard let wrappedSut = sut else {
            XCTFail("OrderViewModel should be initialized")
            return
        }
        
        // When
        let result = wrappedSut.showWarningText("150")
        
        // Then
        XCTAssertTrue(result, "Expected True for invalid input of Number of Stickers")
    }
    
    // MARK: Check post request completion
    func testPostOrderSuccess() throws {
        // Given
        let mockNetworkManager = MockNetworkManager()
        mockNetworkManager.shouldSucceed = true
        
        // When
        guard let wrappedSut = sut else {
            XCTFail("OrderViewModel should be initialized")
            return
        }
        
        let order = OrderRequestUiTile(
            comapnyName: "TestCompanyName",
            companyPhone: "123456789",
            numberOfNFCStickers: 10,
            companyID: "abc0123")
        
        let expectation = XCTestExpectation(description: "Order posted successfully")
        
        // Then
        wrappedSut.postOrder(model: order) { success in
            XCTAssertTrue(success)
            XCTAssertTrue(mockNetworkManager.postOrderCalled)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
}

// MARK: - MockNetworkManager
class MockNetworkManager: NetworkManagerProtocol {
    var shouldSucceed = true
    var postOrderCalled = true
    
    func postOrder(model: OrderRequestModel, completion: @escaping (Bool) -> Void) {
        postOrderCalled = true
        completion(shouldSucceed)
    }
    
    func getCompanies(completion: @escaping (Result<[CompanyModel], Error>) -> Void) { }
    
    func getCompanyImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) { }
}
