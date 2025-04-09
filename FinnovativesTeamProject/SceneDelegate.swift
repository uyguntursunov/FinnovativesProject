//
//  SceneDelegate.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 09/04/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    static var shared = SceneDelegate()
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        SceneDelegate.shared = self
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let viewController = ViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

