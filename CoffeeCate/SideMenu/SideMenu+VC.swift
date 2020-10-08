//
//  SideMenu+VC.swift
//  CoffeeCate
//
//  Created by MAC on 10/3/20.
//  Copyright © 2020 MAC. All rights reserved.
//


import UIKit
import SideMenu

//MARK:- sideMenu Setup
extension UIViewController {
    func setupSideMenu() {
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuDismissWhenBackgrounded = true
        SideMenuManager.default.menuWidth = self.view.frame.size.width * 0.7
        SideMenuManager.default.menuShadowRadius = 1
        SideMenuManager.default.menuDismissOnPush = true
        SideMenuManager.default.menuPushStyle = .defaultBehavior
//        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
//        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        if "lang".localized == "ar" {
            SideMenuManager.default.menuRightNavigationController = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "SideMenu") as? UISideMenuNavigationController
            present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
        } else {
            SideMenuManager.default.menuLeftNavigationController = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "SideMenu") as? UISideMenuNavigationController
            present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
        }
        
    }
    
    func dismissSideMenu() {
        dismiss(animated: false, completion: nil)
    }
}
