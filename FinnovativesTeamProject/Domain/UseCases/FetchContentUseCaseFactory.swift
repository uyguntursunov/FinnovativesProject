//
//  FetchContentUseCaseFactory.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol FetchContentUseCaseFactoryProtocol {
    func createFetchEventsUseCase() -> FetchEventsUseCaseProtocol
    func createFetchFinancialServicesUseCase() -> FetchFinancialServicesUseCaseProtocol
    func createFetchPaymentForServicesUseCase() -> FetchPaymentForServicesUseCaseProtocol
}

final class FetchContentUseCaseFactory: FetchContentUseCaseFactoryProtocol {
    func createFetchEventsUseCase() -> FetchEventsUseCaseProtocol {
        return FetchEventsUseCase()
    }
    
    func createFetchFinancialServicesUseCase() -> FetchFinancialServicesUseCaseProtocol {
        return FetchFinancialServicesUseCase()
    }
    
    func createFetchPaymentForServicesUseCase() -> FetchPaymentForServicesUseCaseProtocol {
        return FetchPaymentForServicesUseCase()
    }
}
