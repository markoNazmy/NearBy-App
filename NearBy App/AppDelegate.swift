//
//  AppDelegate.swift
//  NearBy App
//
//  Created by marko nazmy on 12/5/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController: ViewController!
    // MARK: - Application Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewController = storyboard.instantiateInitialViewController() as! ViewController
        self.window?.rootViewController = self.viewController
        self.window?.makeKeyAndVisible()
        return true
    }
    
}
