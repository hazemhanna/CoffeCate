//
//  ss.swift
//  CoffeeCate
//
//  Created by MAC on 10/2/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

class Singletone: NSObject {
    static let instance = Singletone()
    
    public enum userType {
        case customer
        case guest
        case worker
    }
    
    var appUserType : userType = .guest
    
}
