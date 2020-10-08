//
//  AppDelegate.swift
//  CoffeeCate
//
//  Created by MAC on 9/26/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let sb = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNav")
        window?.rootViewController = sb
        
        return true
    }
    
}

