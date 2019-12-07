//
//  AppDelegate.swift
//  NearBy App
//
//  Created by marko nazmy on 12/5/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit
import Kingfisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISceneDelegate {

    var window: UIWindow?
    // MARK: - Application Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // mainStoryboard
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // rootViewController
        let rootViewController = mainStoryboard.instantiateInitialViewController() as! UINavigationController

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window!.rootViewController = rootViewController
        
        self.window!.makeKeyAndVisible()
        
        setupKingfisher()
        return true
    }
    
    func setupKingfisher() {
        ImageCache.default.maxMemoryCost = 1000
        ImageCache.default.maxDiskCacheSize = 10000000
    }
    
}
