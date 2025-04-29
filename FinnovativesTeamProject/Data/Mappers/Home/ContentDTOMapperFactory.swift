//
//  ContentDTOMapperFactory.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol ContentDTOMapperFactoryProtocol {
    func createEventDTOMapper() -> EventDTOMapperProtocol
    func createFinancialServiceDTOMapper() -> FinancialServiceDTOMapperProtocol
    func createPaymentForServiceDTOMapper() -> PaymentForServiceDTOMapperProtocol
}

final class ContentDTOMapperFactory: ContentDTOMapperFactoryProtocol {
    func createEventDTOMapper() -> EventDTOMapperProtocol {
        return EventDTOMapper()
    }
    
    func createFinancialServiceDTOMapper() -> FinancialServiceDTOMapperProtocol {
        return FinancialServiceDTOMapper()
    }
    
    func createPaymentForServiceDTOMapper() -> PaymentForServiceDTOMapperProtocol {
        return PaymentForServiceDTOMapper()
    }
}
