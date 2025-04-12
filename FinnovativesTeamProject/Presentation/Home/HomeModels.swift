//
//  HomeModels.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 10/04/25.
//

import Foundation

enum HomeModels {
    // MARK: Use cases
    enum GetTotalBalance {
        struct Request {
            let accountID: String
        }
        
        struct Response {
            let totalBalance: Int
        }
        
        struct ViewModel {
            let totalBalance: Int
        }
    }
    
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
            let url: URL?
            let error: Error?
        }
        
        struct ViewModel {
            let urlToOpen: URL?
            let errorMessage: String?
        }
    }
}
