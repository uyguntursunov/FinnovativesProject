//
//  HomeSectionType.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 23/04/25.
//

import Foundation

enum HomeSectionType: Int, CaseIterable {
    case header = 0
    case finServices = 1
    case events = 2
    case paymentForServices = 3
    
    var sectionTitle: String {
        switch self {
        case .header:
            return ""
        case .finServices:
            return "Financial services"
        case .events:
            return ""
        case .paymentForServices:
            return "Payment for services"
        }
    }
}
