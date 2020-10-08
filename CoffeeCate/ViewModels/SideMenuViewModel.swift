//
//  File.swift
//  CoffeeCate
//
//  Created by MAC on 10/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import Foundation
import RxSwift
import SVProgressHUD

struct SideMenuViewModel {
    //MARK:- Properties
    var sideMenuArr = PublishSubject<[SideMenuModel]>()
    
    func fetch(SideMenu: [SideMenuModel]) {
        sideMenuArr.onNext(SideMenu)
        sideMenuArr.onCompleted()
        
    }
    
//    func getProfile() -> Observable<UserProfileModel> {
//           let profile = GetServices.shared.getCustomerProfile()
//           return profile
//       }
    
}
