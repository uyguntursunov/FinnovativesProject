//
//  ServicesConfigurator.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 09/04/25.
//

import UIKit
import SwiftUI

class ServicesConfigurator {
    static func configure() -> UIViewController {
        let servicesView = ServicesView()
        let serviceHostingController = UIHostingController(rootView: servicesView)
        return serviceHostingController
    }
}
