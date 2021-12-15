//
//  SceneDelegate.swift
//  AppStoreApp
//
//  Created by David Yoon on 2021/12/15.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        self.window?.backgroundColor = .systemBackground
        let tabBarController = TabBarController()
        self.window?.rootViewController = tabBarController
        
        self.window?.makeKeyAndVisible()
    }

}

