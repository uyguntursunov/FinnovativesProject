//
//  HomeRouter.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 11/04/25.
//

import Foundation
import SwiftUI

protocol HomeRouterProtocol {
    func openEventDetails()
}

final class HomeRouter {
    weak var viewController: HomeViewController?
}

// MARK: - HomeRouterProtocol

extension HomeRouter: HomeRouterProtocol {
    func openEventDetails() {
        DispatchQueue.main.async {
            let viewModel = GuidelineViewModel()
            let guidelineView = GuidelineView()
                .environmentObject(viewModel)
            let hostingController = UIHostingController(rootView: guidelineView)
            hostingController.modalPresentationStyle = .fullScreen
            self.viewController?.present(hostingController, animated: true)
        }
    }
}
