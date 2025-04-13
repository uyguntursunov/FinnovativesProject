//
//  ServicesAssembly.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 09/04/25.
//

import UIKit
import SwiftUI

final class ServicesAssembly {
    static func createServicesViewController() -> UIViewController {
        let servicesView = ServicesView()
        let serviceHostingController = UIHostingController(rootView: servicesView)
        return serviceHostingController
    }
}
