//
//  HomeFinancialServiceCollectionViewCell.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 11/04/25.
//

import UIKit

final class HomeFinancialServiceCollectionViewCell: UICollectionViewCell {
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        let padding: CGFloat = 13.0
        let imageSize: CGFloat = 40
        backgroundColor = .serviceCardBg
        layer.cornerRadius = 12
        
        [mainImageView, titleLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            mainImageView.widthAnchor.constraint(equalToConstant: imageSize),
            mainImageView.heightAnchor.constraint(equalToConstant: imageSize)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding * 2)
        ])
    }
    
    func configure(model: FinancialServiceUiTile) {
        mainImageView.image = model.image
        titleLabel.text = model.title
    }
}

