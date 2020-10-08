//
//  homeViewModel.swift
//  CoffeeCate
//
//  Created by MAC on 10/4/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation


import Foundation
import RxSwift
import SVProgressHUD

struct HomeViewModel {
    
    var Ads = PublishSubject<[String]>()
    var products = PublishSubject<[String]>()
    var mashines = PublishSubject<[String]>()

    
 
    func fetchAds(AdsArr: [String]) {
        Ads.onNext(AdsArr)
    }

    func fetchProduct(product: [String]) {
          products.onNext(product)
      }

    
    func fetchMachines(mashine: [String]) {
            mashines.onNext(mashine)
        }

    
    
    func showIndicator() {
        SVProgressHUD.show()
    }
    
    func dismissIndicator() {
        SVProgressHUD.dismiss()
    }
    

}
