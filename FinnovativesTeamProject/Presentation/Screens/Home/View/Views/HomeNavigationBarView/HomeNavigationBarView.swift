//
//  HomeNavigationBarView.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 11/04/25.
//

import UIKit

final class HomeNavigationBarView: UIView {
    
    var avatarButtonAction: (() -> Void)?
    var notificationButtonAction: (() -> Void)?
    
    private lazy var avatarButton: UIButton = {
        let button = UIButton()
        button.setTitle("UT", for: .normal)
        button.backgroundColor = .customGreen
        button.tintColor = .white
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapAvatarButton), for: .touchUpInside)
        return button
    }()
    
    private let rightButtonsStackView = HomeNavBarActionButtonsStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setButtonActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarButton.layer.cornerRadius = avatarButton.bounds.height / 2
    }
    
    private func setupSubviews() {
        let padding: CGFloat = 20.0
        let iconSize: CGFloat = 35.0
        backgroundColor = .clear
        
        [avatarButton, rightButtonsStackView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            avatarButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0),
            avatarButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2.0),
            avatarButton.widthAnchor.constraint(equalToConstant: iconSize),
            avatarButton.heightAnchor.constraint(equalToConstant: iconSize)
        ])
        
        NSLayoutConstraint.activate([
            rightButtonsStackView.centerYAnchor.constraint(equalTo: avatarButton.centerYAnchor),
            rightButtonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
        ])
    }
    
    private func setButtonActions() {
        rightButtonsStackView.notificationButtonAction = { [weak self] in
            self?.notificationButtonAction?()
        }
    }
    
    @objc func didTapAvatarButton() {
        avatarButtonAction?()
    }
}

