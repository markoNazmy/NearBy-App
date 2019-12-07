//
//  SceneDelegate.swift
//  NearBy App
//
//  Created by marko nazmy on 12/6/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit
import Kingfisher

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        if let windowScene = scene as? UIWindowScene {
            
            let window = UIWindow(windowScene: windowScene)
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let rootViewController = mainStoryboard.instantiateInitialViewController() as! UINavigationController
            
            window.rootViewController = rootViewController
            
            self.window = window
            window.makeKeyAndVisible()
            setupKingfisher()
        }
    }
    
    func setupKingfisher() {
        ImageCache.default.maxMemoryCost = 1000
        ImageCache.default.maxDiskCacheSize = 10000000
    }
}
