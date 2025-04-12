//
//  HomeAssembly.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 09/04/25.
//

import UIKit

final class HomeAssembly {
    static func createHomeViewController() -> HomeViewController {
        let worker = HomeWorker()
        let router = HomeRouter()
        let presentor = HomePresenter()
        let interactor = HomeInteractor(worker: worker, presentor: presentor)
        let viewController = HomeViewController()
        
        viewController.router = router
        viewController.interactor = interactor
        
        presentor.view = viewController
        router.viewController = viewController
        
        return viewController
    }
}
