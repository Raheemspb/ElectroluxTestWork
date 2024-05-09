//
//  SceneDelegate.swift
//  Electrolux final
//
//  Created by Рахим Габибли on 05.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let tabBar = TabBarController()
        let navigationBar = UINavigationController(rootViewController: tabBar)
        window?.rootViewController = navigationBar
    }
}
