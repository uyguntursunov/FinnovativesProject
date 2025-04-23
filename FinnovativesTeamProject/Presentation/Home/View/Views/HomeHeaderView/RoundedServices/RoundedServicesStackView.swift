//
//  RoundedServicesStackView.swift
//  FinnovativesTeamProject
//
//  Created by Uyg'un Tursunov on 11/04/25.
//

import UIKit

fileprivate let roundedServices: [HomeMainServiceModel] = [
    HomeMainServiceModel(image: SF.creditcardLarge, title: "My cards"),
    HomeMainServiceModel(image: SF.gCircle, title: "Payme Go"),
    HomeMainServiceModel(image: SF.qrcodeViewfinder, title: "QR payment")
]

final class RoundedServicesStackView: UIStackView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        backgroundColor = .clear
        axis = .horizontal
        distribution = .equalSpacing
        
        for count in 0...roundedServices.count - 1 {
            let roundedServiceView = RoundedServiceView()
            roundedServiceView.configure(with: roundedServices[count])
            addArrangedSubview(roundedServiceView)
        }
    }
}
