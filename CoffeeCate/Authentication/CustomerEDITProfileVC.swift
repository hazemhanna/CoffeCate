//
//  aaa.swift
//  CoffeeCate
//
//  Created by MAC on 10/7/20.
//  Copyright © 2020 MAC. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

class CustomerEDITProfileVC: UIViewController {
    
    @IBOutlet weak var CustomerProfileImageView: CustomImageView!
    @IBOutlet weak var backroundImageView: UIImageView!
    @IBOutlet weak var CustomerNameLabel: UILabel!
    @IBOutlet weak var userNameTF: CustomTextField!
    @IBOutlet weak var addressTF: CustomTextField!
    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var mobileTF: CustomTextField!
    @IBOutlet weak var CustomerNameTF: CustomTextField!
    
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backroundImageView.layer.cornerRadius = 20
        backroundImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @IBAction func changePhotoAction(_ sender: UIButton) {
    
    }
    
    @IBAction func EditProfileAction(_ sender: CustomButtons) {
        
    }

}




