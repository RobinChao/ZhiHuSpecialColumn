//
//  DiscoveryController.swift
//  ZhiHuSpecialColumn
//
//  Created by Robin on 4/25/16.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit


class DiscoveryController: BaseViewController {
    
    let segmentControl: SegmentedController = {
        let segmentControl = SegmentedController(frame: CGRect(x: 0, y: 10, width: 240, height: 36))
        segmentControl.items = ["文章", "作者"]
        segmentControl.border = UIColor.clearColor()
        
        return segmentControl
    }()
    
    var pageController: MAPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        segmentControl.addTarget(self, action: #selector(DiscoveryController.segmentControlUpdate(_:)), forControlEvents: .ValueChanged)
        navigationItem.titleView = segmentControl
        
        
        let articalsController = DiscoveryListController()
        let authorsController = DiscoveryListController()
        authorsController.view.backgroundColor = UIColor.redColor()
        
        
        pageController = MAPageViewController(viewControllers:[articalsController, authorsController])
        addChildViewController(pageController)
        view.addSubview(pageController.view)
        pageController.didMoveToParentViewController(self)
        
        
        pageController.transitionCompleted = {index in
            print(index)
            self.segmentControl.selectedIndex = index
        }
        
    }
    
    
    func segmentControlUpdate(sender: SegmentedController){
        print(sender.selectedIndex)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


