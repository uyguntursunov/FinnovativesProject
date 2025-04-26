//
//  NavController.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 26/04/25.
//

import UIKit

enum NavController: String {
    case main
    case transfer
    case payment
    case services
    case cashFlow
    
    var title: String {
        switch self {
        case .main: "Home"
        case .transfer: "Transfer"
        case .payment: "Payment"
        case .services: "Services"
        case .cashFlow: "Cash flow"
        }
    }
    
    var tabBarIcon: UIImage? {
        switch self {
        case .main: SF.house
        case .transfer: SF.arrowLeftRight
        case .payment: SF.creditcard
        case .services: SF.squareGrid
        case .cashFlow: SF.clockArrow
        }
    }
}
