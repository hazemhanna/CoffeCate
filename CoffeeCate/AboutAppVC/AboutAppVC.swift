//
//  File.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//


import Foundation

import UIKit
import RxSwift


class AboutAppVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aboutAppTV: UITableView!
    @IBOutlet weak var backButton: UIButton!

    
    var appPageType = String()

    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAboutApp()
        
        
               if "lang".localized == "ar" {
                              self.backButton.setImage(#imageLiteral(resourceName: "back (11)-1"), for: .normal)
                          } else {
                             self.backButton.setImage(#imageLiteral(resourceName: "back (11)"), for: .normal)
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
}


extension AboutAppVC {
    func getAboutApp() {
        
    }

}
