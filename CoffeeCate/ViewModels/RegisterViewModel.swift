//
//  RegisterViewModel.swift
//  CoffeeCate
//
//  Created by MAC on 10/3/20.
//  Copyright © 2020 MAC. All rights reserved.
//


import Foundation
import RxSwift
import SVProgressHUD


struct RegisterViewModel {
    //Properties
    var name = BehaviorSubject<String>(value: "")
    var email = BehaviorSubject<String>(value: "")
    var username = BehaviorSubject<String>(value: "")
    var password = BehaviorSubject<String>(value: "")
    var confirm_password = BehaviorSubject<String>(value: "")
    var phone = BehaviorSubject<String>(value: "")
    var address = BehaviorSubject<String>(value: "")
    var country_id = Int()
    var city_id = Int()
    var area_id = Int()
    var long = Double()
    var lat = Double()
    var national_id = BehaviorSubject<String>(value: "")
    var car_color = BehaviorSubject<String>(value: "")
    var car_number = BehaviorSubject<String>(value: "")
    var car_model = BehaviorSubject<String>(value: "")
    var drive_license = BehaviorSubject<String>(value: "")
    var file_url = [UIImage]()
    
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
