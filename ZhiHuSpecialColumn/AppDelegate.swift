//
//  AppDelegate.swift
//  ZhiHuSpecialColumn
//
//  Created by Robin on 4/25/16.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = MainTabBarController()
        
        window!.makeKeyAndVisible()
        window!.backgroundColor = UIColor.whiteColor()
        return true
    }

}

