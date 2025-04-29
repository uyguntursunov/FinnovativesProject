//
//  BalanceLabelsStackView.swift
//  FinnovativesTeamProject
//
//  Created by Uyg'un Tursunov on 11/04/25.
//

import UIKit

final class BalanceLabelsVerticalStackView: UIStackView {
    
    private let totalBalanceLabel: UILabel = {
        let label = UILabel()
        label.text = "total_balance".localized
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "balance_amount".localized
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let expenditureLabel: UILabel = {
        let label = UILabel()
        label.text = "expenditure_amount".localized
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let mySpacing: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        backgroundColor = .clear
        axis = .vertical
        spacing = mySpacing
        alignment = .center
        distribution = .fill
        
        [totalBalanceLabel, balanceLabel, expenditureLabel].forEach {
            addArrangedSubview($0)
        }
    }
}
