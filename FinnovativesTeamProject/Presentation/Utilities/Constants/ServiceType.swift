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
        case .credit: return "Credit"
        case .plus: return "payme plus"
        case .deferredPayment: return "Deferred Payment"
        case .tickets: return "payme tickets"
        case .avia: return "payme avia"
        case .governmentServices: return "Certificates and Government Services"
        case .reminders: return "Reminders"
        case .accountPayment: return "Account Payment"
        case .fines: return "Notifications about Traffic Police Fines"
        case .goals: return "Payme Goals"
        case .lifeSituations: return "Life Situations"
        case .charity: return "Charity"
        case .nfcSticker: return "Order NFC Sticker"
        }
    }
    
    var subtitle: String {
        switch self {
        case .credit: return "Get an online credit from TBC BANK"
        case .plus: return "One subscription — many opportunities"
        case .deferredPayment: return "Pay now, repay later"
        case .tickets: return "Purchase tickets for various events"
        case .avia: return "Cashback when paying for flights"
        case .governmentServices: return "Certificates and Government Services"
        case .reminders: return "For receiving payment reminders"
        case .accountPayment: return "Save time and money"
        case .fines: return "Notifications about Traffic Police Fines"
        case .goals: return "A simple way to save for your goals"
        case .lifeSituations: return "Guide for important life events"
        case .charity: return "Support charitable causes"
        case .nfcSticker: return "Order NFC sticker for your business"
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
