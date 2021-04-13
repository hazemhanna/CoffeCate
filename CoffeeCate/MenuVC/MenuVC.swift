//
//  MenuVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
//
//  File.swift
//  CoffeeCate
//
//  Created by MAC on 10/7/20.
//  Copyright © 2020 MAC. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

class MenuVC: UIViewController {
   
    @IBOutlet weak var productTableView : UITableView!
    var favoritesViewModel = FavoritesViewModel()
    @IBOutlet weak var backButton: UIButton!
    let cellIdentifier = "MenuCell"
    let headerCellIdentifier = "HeaderMenuCell"
    
   var  headers = [String]()
    var menuProducts = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.favoritesViewModel.fetchMenuProducts(products: self.menuProducts)
            }
        }
    }

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProductTableView()
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


extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func setupProductTableView() {
        self.headers = ["Hot Coffe","Ice Coffe","Espreso","Chocloate Coffee"]
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        self.productTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.productTableView.register(UINib(nibName: headerCellIdentifier, bundle: nil), forCellReuseIdentifier: headerCellIdentifier)
       
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return  headers.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: headerCellIdentifier) as? HeaderMenuCell else { return UITableViewCell()}
        cell.config(StepHeaderContent: headers[section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 150
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MenuCell else { return UITableViewCell()}
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
}



    

