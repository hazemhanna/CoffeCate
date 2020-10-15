//
//  File.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

import UIKit
import MOLH

class SettingVC: UIViewController {
    
    @IBOutlet weak var languageType: UIButton!
    @IBOutlet weak var arabic: UIButton!
    @IBOutlet weak var english: UIButton!
    @IBOutlet weak var arabicChicBox: UIButton!
    @IBOutlet weak var englishChicBox: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if "lang".localized == "ar" {
            self.arabicChicBox.setImage(#imageLiteral(resourceName: "Group 37"), for: .normal)
            self.languageType.setTitle("غير اللغة", for: .normal)
            self.languageType.contentHorizontalAlignment = .right
            self.arabic.setTitle("اللغة العربية", for: .normal)
            self.arabic.contentHorizontalAlignment = .right
            self.english.setTitle("اللغة الإنجليزية", for: .normal)
            self.english.contentHorizontalAlignment = .right
        } else {
            self.englishChicBox.setImage(#imageLiteral(resourceName: "Group 37"), for: .normal)
            self.languageType.setTitle("change the Language", for: .normal)
            self.languageType.contentHorizontalAlignment = .left
            self.arabic.setTitle("Arabic", for: .normal)
            self.arabic.contentHorizontalAlignment = .left
            self.english.setTitle("English", for: .normal)
            self.english.contentHorizontalAlignment = .left
        }

    }
    
    
       @IBAction func sideMenuAction(_ sender: UIBarButtonItem) {
           self.setupSideMenu()
       }
       @IBAction func backAction(_ sender: UIBarButtonItem) {
            self.navigationController?.popViewController(animated: true)
       }
     
       @IBAction func cartAction(_ sender: UIBarButtonItem) {
           let main = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "CartVC")
           self.navigationController?.pushViewController(main, animated: true)
       }
    

    @IBAction func EnglishLang(_ sender: UIButton) {
     sender.setImage(#imageLiteral(resourceName: "Group 37"), for: .normal)
    self.arabicChicBox.setImage(#imageLiteral(resourceName: "Rectangle 11"), for: .normal)
     if MOLHLanguage.currentAppleLanguage() == "ar" {
         MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
         UIView.appearance().semanticContentAttribute = .forceLeftToRight
         MOLH.reset()
         guard let window = UIApplication.shared.keyWindow else { return }
        let sb = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNav")
        window.rootViewController = sb
        
     } else {
         if ("lang".localized == "en") {
             displayMessage(title: "", message: "Your App is Already in English Language", status: .info, forController: self )
         } else {
             displayMessage(title: "", message: "البرنامج بالفعل على اللغة الإنجليزية", status: .info, forController: self )
         }
         
     }

    }
    
    
     @IBAction func ArbicLang(_ sender: UIButton) {
        sender.setImage(#imageLiteral(resourceName: "Group 37"), for: .normal)
        self.englishChicBox.setImage(#imageLiteral(resourceName: "Rectangle 11"), for: .normal)
           if MOLHLanguage.currentAppleLanguage() == "en" {
                 MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
                 MOLH.reset()
            guard let window = UIApplication.shared.keyWindow else { return }
            let sb = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNav")
            window.rootViewController = sb
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
                 
             } else {
                 if ("lang".localized == "en") {
                     displayMessage(title: "", message: "Your App is Already in Arabic Language", status: .info, forController: self )
                 } else {
                     displayMessage(title: "", message: "البرنامج بالفعل على اللغة العربية", status: .info, forController: self )
                 }
                 
             }
     }
}

