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
        case .plus: return "paymePlus".localized
        case .deferredPayment: return "deferredPayment".localized
        case .tickets: return "paymeTickets".localized
        case .avia: return "paymeAvia".localized
        case .governmentServices: return "govServices".localized
        case .reminders: return "reminders".localized
        case .accountPayment: return "accountPayment".localized
        case .fines: return "trafficPoliceFines".localized
        case .goals: return "paymeGoals".localized
        case .lifeSituations: return "lifeSituations".localized
        case .charity: return "charity".localized
        case .nfcSticker: return "orderNFCSticker".localized
        }
    }
    
    var subtitle: String {
        switch self {
        case .credit: return "creditSub".localized
        case .plus: return "paymePlusSub".localized
        case .deferredPayment: return "deferredPaymentSub".localized
        case .tickets: return "paymeTicketsSub".localized
        case .avia: return "paymeAviaSub".localized
        case .governmentServices: return "govServicesSub".localized
        case .reminders: return "remindersSub".localized
        case .accountPayment: return "accountPaymentSub".localized
        case .fines: return "trafficPoliceFinesSub".localized
        case .goals: return "paymeGoalsSub".localized
        case .lifeSituations: return "lifeSituationsSub".localized
        case .charity: return "charitySub".localized
        case .nfcSticker: return "orderNFCStickerSub".localized
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
