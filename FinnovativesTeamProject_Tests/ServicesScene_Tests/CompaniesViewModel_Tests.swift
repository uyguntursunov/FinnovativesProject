//
//  CompaniesViewModel.swift
//  S
//
//  Created by Abdulvoxid on 28/04/25.
//

import XCTest
@testable import FinnovativesTeamProject

final class CompaniesViewModel_Tests: XCTestCase {
    var sut: CompaniesViewModel?
    var mockNetworkManager2: MockNetworkManager2?
    
    override func setUpWithError() throws {
        mockNetworkManager2 = MockNetworkManager2()
        sut = CompaniesViewModel(networkManager: mockNetworkManager2!)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockNetworkManager2 = nil
    }

    func testGetCompaniesFetchesSuccessfully() throws {
        // Given
        guard let wrappedSut = sut else {
            XCTFail("CompaniesViewModel should be initialized")
            return
        }
        let companies = [
            CompanyModel(id: "1", name: "TestCompany1", imageUrl: "image_url1"),
            CompanyModel(id: "2", name: "TestCompany2", imageUrl: "image_url2")
        ]
        mockNetworkManager2?.companiesToReturn = companies
        let expectation = XCTestExpectation(description: "Companies fetched successfully")
        
        // When
        wrappedSut.getCompanies()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(wrappedSut.allCompanies.count, 2, "Expected 2 companies")
            if wrappedSut.allCompanies.count >= 2 {
                XCTAssertEqual(wrappedSut.allCompanies[0].name, "TestCompany1")
                XCTAssertEqual(wrappedSut.allCompanies[1].name, "TestCompany2")
             } else {
                XCTFail("allCompanies does not contain enough elements")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}

// MARK: MockNetworkManager
class MockNetworkManager2: NetworkManagerProtocol {
    var companiesToReturn: [CompanyModel] = []
    var shouldReturnError: Bool = false

    func getCompanies(completion: @escaping (Result<[CompanyModel], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock error occurred"])))
        } else {
            completion(.success(companiesToReturn))
        }
    }

    func postOrder(model: OrderRequestModel, completion: @escaping (Bool) -> Void) {
        // Tested in another file
    }

    func getCompanyImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        // Tested in another file
    }
}
