//
//  AppDelegate.swift
//  CoffeeCate
//
//  Created by MAC on 9/26/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import MOLH


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let sb = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNav")
        window?.rootViewController = sb
        
        MOLH.shared.activate(true)
        MOLH.shared.specialKeyWords = ["Cancel","Done"]
        if ("lang".localized == "en") {
            MOLHLanguage.setDefaultLanguage("en")
            Helper.saveLang(Lang: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        } else{
            MOLHLanguage.setDefaultLanguage("ar")
            Helper.saveLang(Lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        
        
        return true
    }
    
}

