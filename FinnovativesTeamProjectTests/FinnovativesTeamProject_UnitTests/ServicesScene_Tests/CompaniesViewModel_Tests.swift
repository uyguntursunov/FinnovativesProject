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
    
    override func setUpWithError() throws {
        sut = CompaniesViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGetCompaniesFetchesSuccessfully() throws {
        // Given
        let mockUseCase = MockFetchCompaniesUseCase()
        mockUseCase.companiesToReturn = [
            CompanyEntity(id: "1", name: "TestCompany1", imageUrl: "image_url1"),
            CompanyEntity(id: "2", name: "TestCompany2", imageUrl: "image_url2")
        ]
        sut = CompaniesViewModel(fetchCompaniesUseCase: mockUseCase)
        
        let expectation = XCTestExpectation(description: "Companies fetched successfully")
        
        // When
        sut?.getCompanies()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(self.sut?.allCompanies.count, 4, "Expected 4 companies")
            XCTAssertEqual(self.sut?.allCompanies[0].name, "TestCompany1")
            XCTAssertEqual(self.sut?.allCompanies[1].name, "TestCompany2")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}

// MARK: MockFetchCompaniesUseCase

final class MockFetchCompaniesUseCase: FetchCompaniesUseCaseProtocol {
    var companiesToReturn: [CompanyEntity] = []
    func execute(_ completion: @escaping ([FinnovativesTeamProject.CompanyEntity]) -> Void) {
        completion(companiesToReturn)
    }
}

