//
//  RoundedServiceView.swift
//  PClone
//
//  Created by Uyg'un Tursunov on 15/03/25.
//

import UIKit

class RoundedServiceView: UIView {
    
    private let serviceButton: UIButton = {
        let button = UIButton()
        button.tintColor = .systemGray
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        return button
    }()
    
    private let serviceTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        serviceButton.layer.cornerRadius = serviceButton.bounds.size.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        let padding: CGFloat = 8.0
        let buttonSize: CGFloat = 70
        backgroundColor = .clear
        
        [serviceButton, serviceTitleLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    
        NSLayoutConstraint.activate([
            serviceButton.topAnchor.constraint(equalTo: topAnchor),
            serviceButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            serviceButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            serviceButton.widthAnchor.constraint(equalToConstant: buttonSize),
            serviceButton.heightAnchor.constraint(equalToConstant: buttonSize)
        ])
        
        NSLayoutConstraint.activate([
            serviceTitleLabel.topAnchor.constraint(equalTo: serviceButton.bottomAnchor, constant: padding),
            serviceTitleLabel.centerXAnchor.constraint(equalTo: serviceButton.centerXAnchor),
            serviceTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with model: HomeMainServiceModel) {
        serviceButton.setImage(model.image, for: .normal)
        serviceTitleLabel.text = model.title
    }
}
