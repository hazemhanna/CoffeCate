//
//  LoginVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/3/20.
//  Copyright © 2020 MAC. All rights reserved.
//



import UIKit
import RxSwift
import RxCocoa
import SafariServices


class LoginVC: UIViewController {
    
    
 
    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var passwordTF: CustomTextField!
    @IBOutlet weak var loginButton: CustomButtons!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!

    
    var loginViewModel = LoginViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _ = emailTF.rx.text.map({$0 ?? ""}).bind(to: loginViewModel.email).disposed(by: disposeBag)
        _ = passwordTF.rx.text.map({$0 ?? ""}).bind(to: loginViewModel.password).disposed(by: disposeBag)
        // _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        
        switch UIDevice().type {
        case .iPhone4, .iPhone5, .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhone5S, .iPhoneSE, .iPhoneSE2:
            self.skipButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: (self.skipButton.frame.width - 75), bottom: 0, right: 0)
        default:
            self.skipButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: (self.skipButton.frame.width - 20), bottom: 0, right: 0)
        }
        
        let endEditting = UITapGestureRecognizer(target: self, action:#selector(LoginVC.endEditting(sender:)))
        view.addGestureRecognizer(endEditting)
        
    }

    
    @objc func endEditting(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        //        self.navigationController?.isNavigationBarHidden = false
    }
    @IBAction func loginAction(_ sender: UIButton) {
        guard let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else { return }
           self.navigationController?.pushViewController(main, animated: true)
               
    }
    
    @IBAction func forgetPasswordAction(_ sender: UIButton) {
        guard let main = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "ForgetPasswordVC") as? ForgetPasswordVC else { return }
        self.navigationController?.pushViewController(main, animated: true)
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        guard let main = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationVC else { return }
        self.navigationController?.pushViewController(main, animated: true)
        
    }
    
   @IBAction func skipAction(_ sender: UIButton) {
        guard let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else { return }
        self.navigationController?.pushViewController(main, animated: true)
            
        }
    
}

extension LoginVC {
}

