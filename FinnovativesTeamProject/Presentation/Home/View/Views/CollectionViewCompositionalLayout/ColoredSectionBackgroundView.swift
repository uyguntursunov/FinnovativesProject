//
//  ColoredSectionBackgroundView.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 11/04/25.
//

import UIKit

class ColoredSectionBackgroundView: UICollectionReusableView {
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configure(with section: Int) {
        switch SectionType(rawValue: section) {
        case .header:
            backgroundColor = .clear
        case .finServices:
            backgroundColor = .background
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            layer.cornerRadius = 20
        case .events:
            backgroundColor = .background
        case .paymentForServices:
            backgroundColor = .background
        case .none:
            backgroundColor = .background
        }
    }
}
