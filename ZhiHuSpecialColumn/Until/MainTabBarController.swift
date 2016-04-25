//
//  MainTabBarController.swift
//  ZhiHuSpecialColumn
//
//  Created by Robin on 4/25/16.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let centerImageLength = 43.0
    let centerItemIndex = 2
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllChildController()
    }

}


extension MainTabBarController{
    
    func addAllChildController(){
        // 主页
        addChildVC(DiscoveryController(), title: "发现", image: "icon_tabbar_home", selected: "icon_tabbar_home_active")
        // 关注
        addChildVC(FollowsController(), title: "关注", image: "icon_tabbar_subscription", selected: "icon_tabbar_subscription_active")
        // 添加中间的按钮
        addCenterButton(imageName: "button_write")
        // 简友
        addChildVC(SessionListController(), title: "消息", image: "icon_tabbar_activity", selected: "icon_tabbar_activity_active")
        // 我的
        addChildVC(ProfileInfoController(), title: "我的", image: "icon_tabbar_me", selected: "icon_tabbar_me_active")
    }
    
    func addChildVC(childVC: UIViewController, title: String?, image: String, selected: String) {
        childVC.tabBarItem.title = title
        childVC.tabBarItem.image = UIImage(named: image)
        childVC.tabBarItem.selectedImage = UIImage(named: selected)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        let childNaviagation = UINavigationController(rootViewController: childVC)
        addChildViewController(childNaviagation)
    } 
}


extension MainTabBarController {
    
    
    func addCenterButton(imageName imageName: String) {
        let containController = UIViewController()
        let buttonImage = UIImage(named: imageName)?.imageWithRenderingMode(.AlwaysOriginal)
        
        containController.tabBarItem.image = buttonImage
        containController.tabBarItem.tag = 2
        containController.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        addChildViewController(containController)
    }
     
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        switch item.tag {
        case centerItemIndex:
            writeArticalButtonClick()
        default:
            break
        }
    }
    
    
    func writeArticalButtonClick(){
        let currentSelectedIndex = selectedIndex
        
        if let writeViewController = UIStoryboard(name: "Write", bundle: nil).instantiateViewControllerWithIdentifier("writeViewController") as? WriteViewController {
            
            if viewControllers![centerItemIndex] != viewControllers![currentSelectedIndex] {
                let tempView = viewControllers![currentSelectedIndex].view
                viewControllers![centerItemIndex].view.addSubview(tempView)
            }
            
            
            writeViewController.dismissViewControllerBlock = { [weak self] in
                self?.selectedIndex = currentSelectedIndex
            }
            
            let childNaviagation = UINavigationController(rootViewController: writeViewController)
            self.presentViewController(childNaviagation, animated: true, completion: nil)
        }

    }
}