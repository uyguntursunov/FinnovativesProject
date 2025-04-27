//
//  TabBarController.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 09/04/25.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        configureNavControllers()
    }
    
    private func initViews() {
        tabBar.backgroundColor = .tabBarBackground
        tabBar.barTintColor = .tabBarBackground
        tabBar.tintColor = .main
        tabBar.unselectedItemTintColor = .secondaryLabel
        tabBar.isTranslucent = false
    }
    
    private func configureNavControllers() {
        let viewControllers: [UIViewController] = [
            createNavController(for: .main,
                                rootViewController: HomeAssembly.createHomeViewController()),
            createNavController(for: .transfer,
                                rootViewController: TransferAssembly.createTransferViewController()),
            createNavController(for: .payment,
                                rootViewController: PaymentAssembly.createPaymentViewController()),
            createNavController(for: .services,
                                rootViewController: ServicesAssembly.createServicesViewController()),
            createNavController(for: .cashFlow,
                                rootViewController: CashFlowAssembly.createCashFlowViewController())
        ]
        
        setViewControllers(viewControllers, animated: true)
    }
    
    private func createNavController(for navController: NavController,
                                     rootViewController: UIViewController) -> UINavigationController
    {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = navController.title
        navigationController.tabBarItem.image = navController.tabBarIcon
        return navigationController
    }
}
