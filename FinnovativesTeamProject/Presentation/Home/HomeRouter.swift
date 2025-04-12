//
//  HomeRouter.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 11/04/25.
//

import Foundation

protocol HomeRouterProtocol {
    func openUserAccountScreen()
}

class HomeRouter {
    weak var viewController: HomeViewController?
}

// MARK: - HomeRouterProtocol

extension HomeRouter: HomeRouterProtocol {
    func openUserAccountScreen() {
        
    }
}
