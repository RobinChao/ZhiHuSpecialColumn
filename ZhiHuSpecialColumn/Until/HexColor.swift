//
//  HexColor.swift
//  Work-wx
//
//  Created by Robin on 4/22/16.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit 

extension UIColor {
    
    class func hexColor(hexValue: UInt32) -> UIColor {
        let red   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexValue & 0xFF00) >> 8 ) / 255.0
        let blue  = CGFloat(hexValue & 0xFF) / 255.0
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}