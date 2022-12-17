//
//  AppDelegate.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 10.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        createDiscoverArr()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        
        createCategory()
        CoreDataHandler().fetchCreationsFromCoreData()
        
        return true
    }

}

