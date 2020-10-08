//
//  File.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation


import UIKit
extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static let backgroundColor = UIColor.rgb(165, green: 138, blue: 94)

            
    //        topleft = layerMinXMinYCorner
    //        topright = layerMaxXMinYCorner
    //        bottomright = layerMaxXMaxYCorner
    //        botomleft = layerMinXMaxYCorner
            
    
}


