//
//  AppDelegate.swift
//  SnapKitExample
//
//  Created by Tolga İskender on 23.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupStartVC()
        return true
    }
    
    func setupStartVC(){
        let homeVC = HomeVC()
        let navController = UINavigationController(rootViewController: homeVC)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }

}

