//
//  LoginViewModel.swift
//  CoffeeCate
//
//  Created by MAC on 10/3/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation


import Foundation
import RxSwift
import SVProgressHUD

struct LoginViewModel {
    
    
    var email = BehaviorSubject<String>(value: "")
    var password = BehaviorSubject<String>(value: "")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(email.asObserver(), password.asObserver()) { email, password in
            email.count > 0 && password.count > 0
        }
    }

    func showIndicator() {
         SVProgressHUD.show()
     }
     func dismissIndicator() {
         SVProgressHUD.dismiss()
     }
     
     func showProgress(progress: Float) {
         SVProgressHUD.showProgress(progress)
     }
 
}
