//
//  AppDelegate.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 01/08/2023.
//

import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
   
    var window: UIWindow?
    var appCoordinator = AppCoordinator().strongRouter
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.initWindow(application)
        return true
    }
    
    private func initWindow(_ application: UIApplication){
        window = UIWindow(frame: UIScreen.main.bounds)
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        self.appCoordinator.setRoot(for: window!)
    }

    // MARK: UISceneSession Lifecycle
}

