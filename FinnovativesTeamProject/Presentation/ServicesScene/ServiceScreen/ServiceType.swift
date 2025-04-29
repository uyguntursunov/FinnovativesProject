//
//  ServiceType.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 23/04/25.
//

import Foundation

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
    
    var title: String {
        switch self {
        case .credit: return "credit".localized
        case .plus: return "payme_plus".localized
        case .deferredPayment: return "deferred_payment".localized
        case .tickets: return "payme_tickets".localized
        case .avia: return "payme_avia".localized
        case .governmentServices: return "certificates_gov_services".localized
        case .reminders: return "reminders".localized
        case .accountPayment: return "account_payment".localized
        case .fines: return "traffic_police_fines".localized
        case .goals: return "payme_goals".localized
        case .lifeSituations: return "life_situations".localized
        case .charity: return "charity".localized
        case .nfcSticker: return "order_nfc_sticker".localized
        }
    }
    
    var subtitle: String {
        switch self {
        case .credit: return "credit_sub".localized
        case .plus: return "payme_plus_sub".localized
        case .deferredPayment: return "deferred_payment_sub".localized
        case .tickets: return "payme_tickets_sub".localized
        case .avia: return "payme_avia_sub".localized
        case .governmentServices: return "gov_services_sub".localized
        case .reminders: return "reminders_sub".localized
        case .accountPayment: return "account_payment_sub".localized
        case .fines: return "traffic_police_fines_sub".localized
        case .goals: return "payme_goals_sub".localized
        case .lifeSituations: return "life_situations_sub".localized
        case .charity: return "charity_sub".localized
        case .nfcSticker: return "order_nfc_sticker_sub".localized
        }
    }
    
    var imageString: String {
        switch self {
        case .credit: return "creditcard"
        case .plus: return "plus.square.fill"
        case .deferredPayment: return "heart.circle.fill"
        case .tickets: return "ticket.fill"
        case .avia: return "airplane"
        case .governmentServices: return "building.columns"
        case .reminders: return "bell"
        case .accountPayment: return "dollarsign.circle.fill"
        case .fines: return "exclamationmark.triangle.fill"
        case .goals: return "target"
        case .lifeSituations: return "heart.fill"
        case .charity: return "gift.fill"
        case .nfcSticker: return "wave.3.right.circle"
        }
    }
}
