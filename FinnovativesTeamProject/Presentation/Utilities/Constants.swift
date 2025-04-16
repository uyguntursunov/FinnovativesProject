//
//  Constants.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 09/04/25.
//

import Foundation

enum Titles: String {
    case main = "Home"
    case transfer = "Transfer"
    case payment = "Payment"
    case services = "Services"
    case cashFlow = "Cash flow"
}

enum SectionType: Int, CaseIterable {
    case header = 0
    case finServices = 1
    case events = 2
    case paymentForServices = 3
    
    var sectionTitle: String {
        switch self {
        case .header:
            return ""
        case .finServices:
            return "Fin services"
        case .events:
            return ""
        case .paymentForServices:
            return "Payment for services"
        }
    }
}

enum ServiceType: CaseIterable {
    case credit
    case plus
    case deferredPayment
    case tickets
    case avia
    case governmentServices
    case reminders
    case accountPayment
    case fines
    case goals
    case lifeSituations
    case charity
    case nfcSticker
}
