//
//  ForgetPasswordVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/3/20.
//  Copyright © 2020 MAC. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

class ForgetPasswordVC: UIViewController {

    @IBOutlet weak var phoneTF: CustomTextField!
    @IBOutlet weak var sendEmailButton: CustomButtons!
    
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

            let endEditting = UITapGestureRecognizer(target: self, action:#selector(LoginVC.endEditting(sender:)))
            view.addGestureRecognizer(endEditting)
            
        }

        
        @objc func endEditting(sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
        }
    
    
    @IBAction func sendCodeAction(_ sender: UIButton) {
    guard let main = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "OTPScreenVC") as? OTPScreenVC else { return }
    self.navigationController?.pushViewController(main, animated: true)
    }
    
}
//MARK:- View Model Functions
extension ForgetPasswordVC {
    func POSTGetForgetPassword() {
        
        
    }
}
//MARK:- Data Binding
extension ForgetPasswordVC {
    func DataBinding() {
        
    }
}
