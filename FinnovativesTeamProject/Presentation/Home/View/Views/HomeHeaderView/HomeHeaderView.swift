//
//  HomeHeaderView.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 11/04/25.
//

import UIKit

final class HomeHeaderView: UIView {
    
    private let balanceHorizontalStackView = BalanceHorizontalStackView()
    private let roundedServicesStackView = RoundedServicesStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        let balancePadding: CGFloat = 75.0
        let servicesPadding: CGFloat = 50.0
        backgroundColor = .main
        
        [balanceHorizontalStackView, roundedServicesStackView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            balanceHorizontalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 45.0),
            balanceHorizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: balancePadding),
            balanceHorizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -balancePadding)
        ])
        
        NSLayoutConstraint.activate([
            roundedServicesStackView.topAnchor.constraint(equalTo: balanceHorizontalStackView.bottomAnchor, constant: 40.0),
            roundedServicesStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: servicesPadding),
            roundedServicesStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -servicesPadding),
            roundedServicesStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30.0)
        ])
    }
}
