//
//  NotificationVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
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


class NotificationVC: UIViewController {

    @IBOutlet weak var NotificationTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    private let NotificationCellCellIdentifier = "NotificationCell"
    var disposeBag = DisposeBag()
    var NotificationsVM = NotificationVM()
    var items = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.NotificationsVM.fetchItemList(items: self.items)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCartTableView()
        
               if "lang".localized == "ar" {
                              self.backButton.setImage(#imageLiteral(resourceName: "back (11)-1"), for: .normal)
                          } else {
                             self.backButton.setImage(#imageLiteral(resourceName: "back (11)"), for: .normal)
                          }
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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

extension NotificationVC: UITableViewDelegate {
    
    func bindCartTableView() {
        self.items = ["LoremI psumisi mpldu mmy text othep rin tingand typesettingindustry.","LoremI psumisi mpldu mmy text othep rin tingand typesettingindustry.","LoremI psumisi mpldu mmy text othep rin tingand typesettingindustry.","LoremI psumisi mpldu mmy text othep rin tingand typesettingindustry.","LoremI psumisi mpldu mmy text othep rin tingand typesettingindustry."]
        NotificationTableView.rx.setDelegate(self).disposed(by: disposeBag)
        NotificationTableView.register(UINib(nibName: NotificationCellCellIdentifier, bundle: nil), forCellReuseIdentifier: NotificationCellCellIdentifier)
        NotificationsVM.itemList.bind(to: NotificationTableView.rx.items(cellIdentifier: NotificationCellCellIdentifier, cellType: NotificationCell.self)) { index, element, cell in
          //  cell.config(ProductImageURL: "", ProductName:  "asd", ProductCount: 0, oldPrice: product.price ?? 0.0, newPrice: discountedPrice, discountPercentage: productOffer.discount ?? 0.0, currency: Helper.getCurrentCurrency() ?? "", shipping: "FREE SHIPPING")
                
        }.disposed(by: disposeBag)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

