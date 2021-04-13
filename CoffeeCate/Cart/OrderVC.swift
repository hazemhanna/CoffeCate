//
//  OrderVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/7/20.
//  Copyright © 2020 MAC. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa


class OrderVC: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!    
    @IBOutlet weak var backButton: UIButton!

    private let CartCellIdentifier = "OrderCell"
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

extension OrderVC: UITableViewDelegate {
    func bindCartTableView() {
        self.items = ["aa","aa"]
        cartTableView.rx.setDelegate(self).disposed(by: disposeBag)
        cartTableView.register(UINib(nibName: CartCellIdentifier, bundle: nil), forCellReuseIdentifier: CartCellIdentifier)
        CartVM.itemList.bind(to: cartTableView.rx.items(cellIdentifier: CartCellIdentifier, cellType: OrderCell.self)) { index, element, cell in
          //  cell.config(ProductImageURL: "", ProductName:  "asd", ProductCount: 0, oldPrice: product.price ?? 0.0, newPrice: discountedPrice, discountPercentage: productOffer.discount ?? 0.0, currency: Helper.getCurrentCurrency() ?? "", shipping: "FREE SHIPPING")
            cell.buyAgain = {
            guard let main = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "OrderDetailsVC") as? OrderDetailsVC else { return }
                self.navigationController?.pushViewController(main, animated: true)
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
        return 220
    }
}

extension OrderVC {
    func getCartList() {
        
    }//END of GETCartList
}
