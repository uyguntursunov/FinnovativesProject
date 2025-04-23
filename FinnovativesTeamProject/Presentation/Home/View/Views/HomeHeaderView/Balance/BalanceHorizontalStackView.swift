//
//  BalanceHorizontalStackView.swift
//  FinnovativesTeamProject
//
//  Created by Uyg'un Tursunov on 11/04/25.
//

import UIKit

final class BalanceHorizontalStackView: UIStackView {
    
    private lazy var eyeSlashButton: UIButton = {
        let button = UIButton()
        button.setImage(SF.eyeSlashFill, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleEyeTap), for: .touchUpInside)
        return button
    }()
    
    private let balancelabelsStackView = BalanceLabelsVerticalStackView()
    
    private let showBalanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "SHOW BALANCE"
        return label
    }()
    
    private lazy var eellipsisButton: UIButton = {
        let button = UIButton()
        button.setImage(SF.ellipsis, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleEllipsisTap), for: .touchUpInside)
        return button
    }()
    
    var isBalanceVisible: Bool = false {
        didSet {
            showBalanceLabel.isHidden = isBalanceVisible
            balancelabelsStackView.isHidden = !isBalanceVisible
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        let imageViewSize: CGFloat = 25.0
        backgroundColor = .clear
        axis = .horizontal
        alignment = .center
        distribution = .equalSpacing
        
        [eyeSlashButton, balancelabelsStackView, showBalanceLabel, eellipsisButton].forEach {
            addArrangedSubview($0)
        }
        
        showBalanceLabel.isHidden = true
        
        NSLayoutConstraint.activate([
            eyeSlashButton.widthAnchor.constraint(equalToConstant: imageViewSize),
            eyeSlashButton.heightAnchor.constraint(equalToConstant: imageViewSize),
            eellipsisButton.widthAnchor.constraint(equalToConstant: imageViewSize),
            eellipsisButton.heightAnchor.constraint(equalToConstant: imageViewSize)
        ])
    }
    
    @objc func handleEyeTap() {
        isBalanceVisible.toggle()
        if isBalanceVisible {
            eyeSlashButton.setImage(SF.eyeSlashFill, for: .normal)
        } else {
            eyeSlashButton.setImage(SF.eyeFill, for: .normal)
        }
    }
    
    @objc func handleEllipsisTap() {
        
    }
}
