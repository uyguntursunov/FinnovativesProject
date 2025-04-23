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

enum ServiceTitles: String {
    case credit = "Credit"
    case paymePlus = "payme plus"
    case deferredPayment = "Deferred Payment"
    case paymeTickets = "payme tickets"
    case paymeAvia = "payme avia"
    case certificatesAndGovernmentServices = "Certificates and Government Services"
    case reminders = "Reminders"
    case accountPayment = "Account Payment"
    case notificationsAboutTrafficPoliceFines = "Notifications about Traffic Police Fines"
    case paymeGoals = "Payme Goals"
    case lifeSituations = "Life Situations"
    case charity = "Charity"
    case orderNFCSticker = "Order NFC Sticker"
}

enum ServiceSubtitles: String {
    case getOnlineCredit = "Get an online credit from TBC BANK"
    case oneSubscriptionManyOpportunities = "One subscription — many opportunities"
    case payNowRepayLater = "Pay now, repay later"
    case purchaseTickets = "Purchase tickets for various events"
    case cashbackWithSalonCard = "5% cashback when paying for tickets with Salon Card"
    case empty = ""
    case paymentNotifications = "For receiving payment notifications"
    case saveForGoals = "A simple way to save for your goals"
    case guideForLifeEvents = "Guide for important life events"
    case orderNFCSticker = "Order NFC sticker for your business"
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

