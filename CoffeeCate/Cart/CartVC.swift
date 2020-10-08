//
//  CartVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class CartVC: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
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

extension CartVC: UITableViewDelegate {
    
    func bindCartTableView() {
        self.items = ["aa","aa","aaa","aa","aa"]
        cartTableView.rx.setDelegate(self).disposed(by: disposeBag)
        cartTableView.register(UINib(nibName: CartCellIdentifier, bundle: nil), forCellReuseIdentifier: CartCellIdentifier)
        CartVM.itemList.bind(to: cartTableView.rx.items(cellIdentifier: CartCellIdentifier, cellType: CartCell.self)) { index, element, cell in
          //  cell.config(ProductImageURL: "", ProductName:  "asd", ProductCount: 0, oldPrice: product.price ?? 0.0, newPrice: discountedPrice, discountPercentage: productOffer.discount ?? 0.0, currency: Helper.getCurrentCurrency() ?? "", shipping: "FREE SHIPPING")
                
           
            
            cell.decreaseQuantity = {
               // if self.items[index].quantity ?? 0 > 1 {
                        //let counter = (self.items[index].quantity ?? 0) - 1
                      //  cell.counterLabel.text = "\(counter)"
                    //}
                    
            }
            cell.increaseQuantity = {
                //let counter = (self.items[index].quantity ?? 0) + 1
                //cell.counterLabel.text = "\(counter)"
               
                
            }
            cell.deleteActiion = {
                
            }
        }.disposed(by: disposeBag)
//        cartTableView.rx.itemSelected.bind { (indexPath) in
//            guard let main = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailsVC") as? ProductDetailsVC else { return }
//            let product = self.items[indexPath.row].product ?? Product()
//            main.productId = product.id ?? 0
//            main.modalPresentationStyle = .fullScreen
//            main.modalTransitionStyle = .crossDissolve
//            self.present(main, animated: true, completion: nil)
//        }.disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension CartVC {
    func getCartList() {
        
    }//END of GETCartList
}
