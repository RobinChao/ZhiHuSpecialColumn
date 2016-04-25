//
//  AppDelegate.swift
//  ZhiHuSpecialColumn
//
//  Created by Robin on 4/25/16.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = MainTabBarController()
        
        
        let rootController = window?.rootViewController as! UITabBarController
        loadSplashImage("http://news-at.zhihu.com/api/4/start-image/1080*1776") { (name, image) in
            self.window!.rootViewController = LaunchImageController.addTransitionToController(rootController, modalTransitionStyle: .CrossDissolve, image: image, sourceName: name)
        }
        
        
        window!.makeKeyAndVisible()
        window!.backgroundColor = UIColor.whiteColor()
        return true
    }

}


extension AppDelegate{
    
    func loadSplashImage(url: String, onSuccess:(String, UIImage) -> Void) {
        var data: NSData? = nil
        do {
            data = try NSURLSession.sharedSession().sendSynchronousDataTaskWithURL(NSURL(string: url)!)
        } catch _ {
            data = nil
        }
        
        if let reponseData = data {
            let json = JSON(data: reponseData)
            let imageUrl = json["img"].string
            let name = json["text"].string
            
            //TODO: should cache the images
            if let imgURL = imageUrl {
                do {
                    data = try NSURLSession.sharedSession().sendSynchronousDataTaskWithURL(NSURL(string: imgURL)!)
                } catch let e as  NSError  {
                    print("Error to load splash image: \(e.description)")
                }
                
                if let d = data, let result = UIImage(data: d) {
                    onSuccess(name!, result)
                }
            }
        }
    }
}
