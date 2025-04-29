//
//  ContentUiTileMapperFactory.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol ContentUiTileMapperFactoryProtocol {
    func createEventDtoMapper() -> EventUiTileMapperProtocol
    func createFinancialServiceDtoMapper() -> FinancialServiceUiTileMapperProtocol
    func createPaymentForServiceDtoMapper() -> PaymentForServiceUiTileMapperProtocol
}

final class ContentUiTileMapperFactory: ContentUiTileMapperFactoryProtocol {
    func createEventDtoMapper() -> EventUiTileMapperProtocol {
        return EventUiTileMapper()
    }
    
    func createFinancialServiceDtoMapper() -> FinancialServiceUiTileMapperProtocol {
        return FinancialServiceUiTileMapper()
    }
    
    func createPaymentForServiceDtoMapper() -> PaymentForServiceUiTileMapperProtocol {
        return PaymentForServiceUiTileMapper()
    }
}
