//
//  LaunchImageController.swift
//  ZhiHuSpecialColumn
//
//  Created by Robin on 4/25/16.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit

class LaunchImageController: UIViewController {
    
    private let TIME_DURATION = 4.0
    private let FROM_TIME_DURATION = 1.66
    private let ALPHA: CGFloat = 0.0
    private let X_SCALE: CGFloat = 1.15
    private let Y_SCALE: CGFloat = 1.15
    
    private var sourceImage: UIImage!
    private var sourceLabel: UILabel!
    
    var pushToController: UIViewController!
    
    private let fromImageView: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        return imageView
    }()
    
    private let toImageView: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        return imageView
    }()
    
    private let maskImageView: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        return imageView
    }()
    
    private var logoImageView: UIImageView? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if respondsToSelector(#selector(UIViewController.setNeedsStatusBarAppearanceUpdate)) {
            prefersStatusBarHidden()
            self.setNeedsStatusBarAppearanceUpdate()
        }
        
        let width = UIScreen.mainScreen().bounds.width
        let height = width > 400 ? width*570/1536 : 185
        logoImageView = UIImageView(frame: CGRect(x: 0, y: UIScreen.mainScreen().bounds.height - height, width: width, height:  height))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        fromImageView.image = UIImage(named: "FakeLaunchImage")
        view.addSubview(fromImageView)
        
        maskImageView.image = UIImage(named: "MaskImage")
        view.insertSubview(maskImageView, belowSubview: fromImageView)
        
        toImageView.image = sourceImage
        view.insertSubview(toImageView, belowSubview: maskImageView)
        
        logoImageView!.image = UIImage(named: "Splash_Logo_Plus")
        view.insertSubview(logoImageView!, aboveSubview: toImageView)
        
        view.addSubview(sourceLabel)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(TIME_DURATION) { 
            self.fromImageView.alpha = self.ALPHA
        }
        
        UIView.animateWithDuration(TIME_DURATION) { 
            self.toImageView.transform = CGAffineTransformMakeScale(self.X_SCALE, self.Y_SCALE)
        }
        
        NSTimer.scheduledTimerWithTimeInterval(TIME_DURATION, target: self, selector: #selector(LaunchImageController.presentNextController(_:)), userInfo: pushToController, repeats: false)
    }
    
    func presentNextController(timer: NSTimer) {
        let viewController: UIViewController = timer.userInfo as! UIViewController
        
        self.presentViewController(viewController, animated: true) { 
            let discoveryController = DiscoveryController()
            self.presentViewController(discoveryController, animated: true, completion: nil)
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
    
    static func addTransitionToController(viewController: UIViewController, modalTransitionStyle: UIModalTransitionStyle, image: UIImage, sourceName: String) -> UIViewController {
        let instance = LaunchImageController()
        instance.initTarget(viewController, modalTransitiontyle: modalTransitionStyle, image: image, sourceName: sourceName)
        return instance
    }
    
    func initTarget(targetController: UIViewController, modalTransitiontyle: UIModalTransitionStyle, image: UIImage, sourceName: String) {
        targetController.modalTransitionStyle = modalTransitiontyle
        pushToController = targetController
        
        sourceImage = image
        
        let rect = pushToController.view.frame
        //初始化版权Label
        self.sourceLabel = UILabel(frame: CGRectMake((rect.size.width-200)/2, (rect.size.height-60), 200, 30))
        self.sourceLabel.text = sourceName        //设置版权Label的内容
        self.sourceLabel.textColor = UIColor.grayColor()     //颜色
        self.sourceLabel.font = UIFont.systemFontOfSize(10) //字体大小
        self.sourceLabel.textAlignment = NSTextAlignment.Center     //文字居中对齐
        self.sourceLabel.textColor = UIColor.whiteColor()   //字体颜色为白色
        self.sourceLabel.backgroundColor = UIColor.clearColor() //背景色为透明
        
    }
    
}
