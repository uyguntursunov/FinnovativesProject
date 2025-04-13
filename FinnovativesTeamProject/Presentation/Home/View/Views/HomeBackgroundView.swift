//
//  HomeBackgroundVIew.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 12/04/25.
//

import UIKit

class HomeBackgroundView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        let topView = UIView()
        topView.backgroundColor = .main
        let bottomView = UIView()
        bottomView.backgroundColor = .background
        bottomView.layer.cornerRadius = 20
        
        [topView, bottomView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
}

