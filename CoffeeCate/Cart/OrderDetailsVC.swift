//
//  OrderDetailsVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/15/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class OrderDetailsVC : UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var backButton: UIButton!
    
    private let CartCellIdentifier = "CartCell"
    var disposeBag = DisposeBag()
    var CartVM = CartViewModel()
    var items = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.CartVM.fetchItemList(items: self.items)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindCartTableView()
        if "lang".localized == "ar" {
                   self.backButton.setImage(#imageLiteral(resourceName: "back (11)-1"), for: .normal)
               } else {
                   self.backButton.setImage(#imageLiteral(resourceName: "back (11)"), for: .normal)
               }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
            self.getCartList()
    }
    
       @IBAction func sideMenuAction(_ sender: UIBarButtonItem) {
           self.setupSideMenu()
       }
       @IBAction func backAction(_ sender: UIBarButtonItem) {
            self.navigationController?.popViewController(animated: true)
       }
     
       @IBAction func cartAction(_ sender: UIBarButtonItem) {
           let main = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "CartVC")
           self.navigationController?.pushViewController(main, animated: true)
       }
}

extension OrderDetailsVC: UITableViewDelegate {
    
    func bindCartTableView() {
        self.items = ["aa","aa","aaa"]
        cartTableView.rx.setDelegate(self).disposed(by: disposeBag)
        cartTableView.register(UINib(nibName: CartCellIdentifier, bundle: nil), forCellReuseIdentifier: CartCellIdentifier)
        CartVM.itemList.bind(to: cartTableView.rx.items(cellIdentifier: CartCellIdentifier, cellType: CartCell.self)) { index, element, cell in
          //  cell.config(ProductImageURL: "", ProductName:  "asd", ProductCount: 0, oldPrice: product.price ?? 0.0, newPrice: discountedPrice, discountPercentage: productOffer.discount ?? 0.0, currency: Helper.getCurrentCurrency() ?? "", shipping: "FREE SHIPPING")
            cell.counterLabel.isHidden = true
            cell.increaseButton.isHidden = true
            cell.deleteButton.isHidden = true
            cell.decreaseButton.isHidden = true
            
        }.disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension OrderDetailsVC {
    func getCartList() {
        
    }//END of GETCartList
}
