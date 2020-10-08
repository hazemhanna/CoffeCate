//
//  UpdatePasswordVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/3/20.
//  Copyright © 2020 MAC. All rights reserved.
//



import UIKit
import RxSwift
import RxCocoa
class UpdatePasswordVC: UIViewController {
    
    @IBOutlet weak var new_passwordTF: CustomTextField!
    @IBOutlet weak var new_password_confirmationTF: CustomTextField!
    @IBOutlet weak var confirmButton: CustomButtons!
    
    var email = String()
    var code = String()
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        DataBinding()
          let endEditting = UITapGestureRecognizer(target: self, action:#selector(LoginVC.endEditting(sender:)))
            view.addGestureRecognizer(endEditting)
            
        }
    
    @objc func endEditting(sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
        }
    
    
}
//MARK:- View Model Functions
extension UpdatePasswordVC {}
//MARK:- Data Binding
extension UpdatePasswordVC {
    func DataBinding() {
        
    }
}

