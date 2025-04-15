//
//  HomeRouter.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 11/04/25.
//

import Foundation

protocol HomeRouterProtocol {
    func openEventDetails()
}

final class HomeRouter {
    weak var viewController: HomeViewController?
}

// MARK: - HomeRouterProtocol

extension HomeRouter: HomeRouterProtocol {
    func openEventDetails() {
        let viewControllerToPresent = GuidelinesViewController()
        viewController?.present(viewControllerToPresent, animated: true)
    }
}
