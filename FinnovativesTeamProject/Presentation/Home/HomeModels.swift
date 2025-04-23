//
//  HomeModels.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 10/04/25.
//

import Foundation

enum HomeModels {
    // MARK: Use cases
    enum FetchContent {
        struct Request {}
        
        struct Response {
            let events: [EventModel]
            let financialServices: [FinancialServiceModel]
            let paymentForServices: [PaymentForServiceModel]
        }
        
        struct ViewModel {
            let events: [EventModel]
            let financialServices: [FinancialServiceModel]
            let paymentForServices: [PaymentForServiceModel]
        }
    }
    
    enum ScanNFC {
        struct Request {}
        
        struct Response {
            let urlToOpen: URL?
            let error: Error?
        }
        
        struct ViewModel {
            let urlToOpen: URL?
            let errorMessage: String?
        }
    }
}
