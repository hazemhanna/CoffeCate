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

struct CartViewModel {
    
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
    
//    func getCart() -> Observable<CartModel> {
//        let observer = GetServices.shared.getCart()
//        return observer
//    }
//    func postAddToCart(product_id: Int, quantity: Int) -> Observable<Success_ErrorModel> {
//        let params = [
//            "product_id": product_id,
//            "quantity": quantity
//        ]
//
//        let observer = AddServices.shared.POSTAddToCart(params: params)
//        return observer
//    }
//    func postRemoveToCart(product_id: Int, quantity: Int) -> Observable<Success_ErrorModel> {
//        let params = [
//            "id": product_id,
//            "quantity": quantity
//        ]
//
//        let observer = AddServices.shared.POSTRemoveFromCart(params: params)
//        return observer
//    }
}
