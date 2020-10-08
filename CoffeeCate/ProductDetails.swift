//
//  ProductDetails.swift
//  CoffeeCate
//
//  Created by MAC on 10/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//





import UIKit
import RxSwift
import RxCocoa


class ProductDetails : UIViewController {
    
    @IBOutlet weak var searchTF: CustomTextField!
    @IBOutlet weak var productImageView: UIImageView!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImageView.layer.cornerRadius = 20
        productImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
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





