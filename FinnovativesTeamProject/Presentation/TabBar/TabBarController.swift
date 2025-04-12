//
//  TabBarController.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 09/04/25.
//

import UIKit

let navControllers: [NavigationController] = [
    NavigationController(title: Titles.main.rawValue, tabBarImage: SFSymbols.house),
    NavigationController(title: Titles.transfer.rawValue, tabBarImage: SFSymbols.arrowLeftRight),
    NavigationController(title: Titles.payment.rawValue, tabBarImage: SFSymbols.creditcard),
    NavigationController(title: Titles.services.rawValue, tabBarImage: SFSymbols.squareGrid),
    NavigationController(title: Titles.cashFlow.rawValue, tabBarImage: SFSymbols.clockArrow)
]

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        configureNavControllers()
    }
    
    private func initViews() {
        tabBar.backgroundColor = .background
        tabBar.barTintColor = .background
        tabBar.tintColor = .main
        tabBar.unselectedItemTintColor = .secondaryLabel
        tabBar.isTranslucent = false
    }
    
    private func configureNavControllers() {
        let homeVC = HomeAssembly.createHomeViewController()
        let transferVC = TransferAssembly.createTransferViewController()
        let paymentVC = PaymentAssembly.createPaymentViewController()
        let servicesVC = ServicesAssembly.createServicesViewController()
        let cashFlowVC = CashFlowAssembly.createCashFlowViewController()
        
        let viewControllers = [
            UINavigationController(rootViewController: homeVC),
            UINavigationController(rootViewController: transferVC),
            UINavigationController(rootViewController: paymentVC),
            UINavigationController(rootViewController: servicesVC),
            UINavigationController(rootViewController: cashFlowVC)
        ]
        
        for (index, vc) in viewControllers.enumerated() {
            let title = navControllers[index].title
            if let tabBarImage = navControllers[index].tabBarImage {
                vc.tabBarItem = UITabBarItem(title: title, image: tabBarImage, tag: index)
            }
        }
        
        setViewControllers(viewControllers, animated: true)
    }
}
