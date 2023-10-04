//
//  AppDelegate.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 9/26/23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = HomeController()
        window?.makeKeyAndVisible()
        return true
    }


    
}

