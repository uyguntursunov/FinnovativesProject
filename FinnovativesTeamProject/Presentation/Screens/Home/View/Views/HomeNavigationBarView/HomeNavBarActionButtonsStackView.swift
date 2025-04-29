//
//  HomeNavBarActionButtonsStackView.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 11/04/25.
//

import UIKit

final class HomeNavBarActionButtonsStackView: UIStackView {
    
    var notificationButtonAction: (() -> Void)?
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(SF.magnifyingglass, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(SF.bell, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapNotificationButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        let iconSize: CGFloat = 25.0
        backgroundColor = .clear
        axis = .horizontal
        distribution = .fillEqually
        spacing = 15
        
        [searchButton, notificationButton].forEach { addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            searchButton.widthAnchor.constraint(equalToConstant: iconSize),
            searchButton.heightAnchor.constraint(equalToConstant: iconSize),
            notificationButton.widthAnchor.constraint(equalToConstant: iconSize),
            notificationButton.heightAnchor.constraint(equalToConstant: iconSize)
        ])
    }
    
    @objc func didTapNotificationButton() {
        notificationButtonAction?()
    }
}
