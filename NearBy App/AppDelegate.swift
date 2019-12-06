//
//  AppDelegate.swift
//  NearBy App
//
//  Created by marko nazmy on 12/5/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISceneDelegate {

    var window: UIWindow?
    var viewController: VenuesViewController!
    // MARK: - Application Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // mainStoryboard
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // rootViewController
        let rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "VenuesViewController") as! VenuesViewController
        
        // navigationController
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.isNavigationBarHidden = true // or not, your choice.
        
        // self.window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window!.rootViewController = navigationController
        
        self.window!.makeKeyAndVisible()
        return true
    }
    
}
