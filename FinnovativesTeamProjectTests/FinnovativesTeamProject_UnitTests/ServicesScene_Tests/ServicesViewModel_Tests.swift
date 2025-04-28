//
//  ServicesViewModel_Tests.swift
//  FinnovativesTeamProject_Tests
//
//  Created by Abdulvoxid on 25/04/25.
//

import XCTest
@testable import FinnovativesTeamProject

final class ServicesViewModel_Tests: XCTestCase {
    var sut: ServiceViewModel?

    override func setUpWithError() throws {
        sut = ServiceViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testIsServicesModelProvidesDataCorrectly() throws {
        // Given
        let expectedServices = ServiceType.allCases.map { service in
            ServiceModel(imageString: service.imageString,
                         title: service.title,
                         subtitle: service.subtitle,
                         type: service
            )
        }
        
        // When
        guard let actualServices = sut?.services else {
            XCTFail("Services array should not be nil")
            return
        }
        
        // Then
        // Check if the number of services matches the number of ServiceType cases
        XCTAssertEqual(actualServices.count, expectedServices.count,
                       "The number of services are not equal to the number of ServiceType cases!")
        
        // Check all services are present and correctly configured
        for (index, actualService) in actualServices.enumerated() {
            let expectedService = expectedServices[index]
            XCTAssertEqual(
                actualService.imageString, expectedService.imageString,
                "Image string mismatch for service at index \(index)"
            )
            XCTAssertEqual(
                actualService.title, expectedService.title,
                "Title mismatch for service at index \(index)"
            )
            XCTAssertEqual(
                actualService.subtitle, expectedService.subtitle,
                "Subtitle mismatch for service at index \(index)"
            )
            XCTAssertEqual(
                actualService.type, expectedService.type,
                "Service type mismatch for service at index \(index)"
            )
        }
    }
}
