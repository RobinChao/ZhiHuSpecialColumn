//
//  WriteViewController.swift
//  ZhiHuSpecialColumn
//
//  Created by Robin on 4/25/16.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {
    var dismissViewControllerBlock: (() -> ()) = {}
    
    override func viewDidLoad() {
        super.viewDidLoad() 
         
        let cancleItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(WriteViewController.backItemAction))
        navigationItem.leftBarButtonItem = cancleItem
        
    }
    
    
    func backItemAction() {
        dismissViewControllerBlock()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
