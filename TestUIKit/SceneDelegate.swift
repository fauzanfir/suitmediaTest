//
//  SceneDelegate.swift
//  TestUIKit
//
//  Created by Fauzan Firzandy on 10/08/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: ScreenAViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

