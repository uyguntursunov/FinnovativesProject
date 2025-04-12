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
        case .events:
            backgroundColor = .secondarySystemBackground
            layer.cornerRadius = 20
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .finServices:
            backgroundColor = .secondarySystemBackground
        case .paymentForServices:
            backgroundColor = .secondarySystemBackground
        case .none:
            backgroundColor = .secondarySystemBackground
        }
    }
}
