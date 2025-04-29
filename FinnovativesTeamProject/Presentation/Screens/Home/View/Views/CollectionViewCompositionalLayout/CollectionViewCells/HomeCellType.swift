//
//  CellType.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 16/04/25.
//

import UIKit

enum HomeCellType {
    case homeHeader
    case homeEvent
    case homeFinancialService
    case paymentForService
    
    var cellClass: UICollectionViewCell.Type {
        switch self {
        case .homeHeader: return HomeHeaderCollectionViewCell.self
        case .homeEvent: return HomeEventCollectionViewCell.self
        case .homeFinancialService: return HomeFinancialServiceCollectionViewCell.self
        case .paymentForService: return PaymentForServiceCollectionViewCell.self
        }
    }
    
    var reuseIdentifier: String {
        String(describing: cellClass)
    }
}
