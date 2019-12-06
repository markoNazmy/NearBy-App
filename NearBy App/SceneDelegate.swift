//
//  SceneDelegate.swift
//  NearBy App
//
//  Created by marko nazmy on 12/6/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        if let windowScene = scene as? UIWindowScene {
            
            let window = UIWindow(windowScene: windowScene)
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            // rootViewController
            let rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "VenuesViewController") as! VenuesViewController
            
            // navigationController
            let navigationController = UINavigationController(rootViewController: rootViewController)
            
            navigationController.isNavigationBarHidden = true // or not, your choice.
            
            // self.window
            
            window.rootViewController = navigationController
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
