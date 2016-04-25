//
//  AppAppearce.swift
//  Work-wx
//
//  Created by Robin on 4/22/16.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit


func setupAPPAppearce() {
    UINavigationBar.appearance().barTintColor = UIColor.hexColor(0x0099f1)
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    
    UITabBar.appearance().barTintColor = UIColor.hexColor(0x617c9f)//背景色
    UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.grayColor()], forState:.Normal)
    UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.redColor()], forState:.Selected)

}