//
//  favoritesViewModel.swift
//  CoffeeCate
//
//  Created by MAC on 10/7/20.
//  Copyright © 2020 MAC. All rights reserved.
//



import Foundation
import RxSwift
import SVProgressHUD


struct FavoritesViewModel {
    
    
    var FavoriteProducts = PublishSubject<[String]>()
    var menuProducts = PublishSubject<[String]>()

    
    func fetchFavoriteProducts(products: [String]) {
        FavoriteProducts.onNext(products)
    }
    
    
    func fetchMenuProducts(products: [String]) {
           menuProducts.onNext(products)
       }
    
 
    func showIndicator() {
        SVProgressHUD.show()
    }
    func dismissIndicator() {
        SVProgressHUD.dismiss()
    }
    
    
//    func getFavorites() -> Observable<FavoritesModel> {
//        let observer = GetServices.shared.getFavorites()
//        return observer
//    }
//    func postAddRemoveToFavorite(item_id: Int, item_type: String, device_token: String) -> Observable<AddRemoveFavoriteModel> {
//        let params: [String : Any] = [
//            "item_id": item_id,
//            "item_type": item_type
//        ]
//        let observer = AddServices.shared.postAddRemoveFavorite(params: params)
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
//    func getCart() -> Observable<CartModel> {
//        let observer = GetServices.shared.getCart()
//        return observer
//    }
}

