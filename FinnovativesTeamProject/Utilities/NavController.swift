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
        case .main: "home".localized
        case .transfer: "transfer".localized
        case .payment: "payment".localized
        case .services: "services".localized
        case .cashFlow: "cashFlow".localized
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
