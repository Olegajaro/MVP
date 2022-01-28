//
//  SceneDelegate.swift
//  MVP
//
//  Created by Олег Федоров on 27.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let mainVC = ModuleBuilder.createMainModule()
        let navBar = UINavigationController(rootViewController: mainVC)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = navBar
    }
}

