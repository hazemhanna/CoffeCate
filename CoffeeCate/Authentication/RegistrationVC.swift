//
//  RegistrationVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/3/20.
//  Copyright © 2020 MAC. All rights reserved.
//


import UIKit
import RxCocoa
import RxSwift


class RegistrationVC: UIViewController {
    
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var driverView: UIView!
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var userNameTF: CustomTextField!
    @IBOutlet weak var passwordTF: CustomTextField!
    @IBOutlet weak var confirm_passwordTF: CustomTextField!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var carModelTF: CustomTextField!
    @IBOutlet weak var UploadButton: CustomButtons!
    @IBOutlet weak var uploadStackView: UIStackView!
    @IBOutlet weak var registerButton: CustomButtons!
    @IBOutlet weak var nameTF: CustomTextField!
    @IBOutlet weak var locationStackView: UIStackView!
    @IBOutlet weak var carColorTF: CustomTextField!
    @IBOutlet weak var carNumberTF: CustomTextField!
    @IBOutlet weak var driverLicenseTF: CustomTextField!
    @IBOutlet weak var locationButton: CustomButtons!
    @IBOutlet weak var currentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var nationalIDLabel: CustomTextField!
    @IBOutlet weak var showTermsAndConditionsButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    
    var dialCode = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        switch UIDevice().type {
        case .iPhone4, .iPhone5, .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhone5S, .iPhoneSE, .iPhoneSE2:
            self.skipButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: (self.skipButton.frame.width - 75), bottom: 0, right: 0)
        default:
            self.skipButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: (self.skipButton.frame.width - 20), bottom: 0, right: 0)
        }

        

      }

    
    func bindingData() {
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
    }

    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
    guard let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else { return }
    self.navigationController?.pushViewController(main, animated: true)
        
    }
    
    @IBAction func skipAction(_ sender: UIButton) {
     guard let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else { return }
     self.navigationController?.pushViewController(main, animated: true)
         
     }
    
    
}
//ViewModel Functions
extension RegistrationVC {
    
}


