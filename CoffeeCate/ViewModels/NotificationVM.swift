//
//  NotificationVM.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
//
//  CartViewModel.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//



import Foundation
import RxSwift
import SVProgressHUD

struct NotificationVM {
    
    var itemList = PublishSubject<[String]>()
    
    func fetchItemList(items: [String]) {
        itemList.onNext(items)
    }
    func showIndicator() {
        SVProgressHUD.show()
    }
    func dismissIndicator() {
        SVProgressHUD.dismiss()
    }
    

}
