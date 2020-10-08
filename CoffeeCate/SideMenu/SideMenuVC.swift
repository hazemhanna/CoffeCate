//
//  SideMenuVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/3/20.
//  Copyright © 2020 MAC. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa
class SideMenuVC: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sideMenuTableView: UITableView!
    
    private let cellIdentifier = "SideMenuCell"
    //MARK:- Properties
    let token = Helper.getAPIToken() ?? ""
    var sideMenuArr = [SideMenuModel]() {
        didSet {
            DispatchQueue.main.async {
            self.sideMenuViewModel.fetch(SideMenu: self.sideMenuArr)
            }
        }
    }
    var sideMenuViewModel = SideMenuViewModel()
    let disposeBag = DisposeBag()
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.nameLabel.adjustsFontSizeToFitWidth = true
        self.nameLabel.minimumScaleFactor = 0.5
        bindTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
     self.navigationController?.navigationBar.isHidden = false
        super.viewWillAppear(false)
       // if token != "" {
            if "lang".localized == "ar" {
                self.sideMenuArr = [
                                SideMenuModel(name: "الصفحة الرئيسية", id: "Home"),
                                SideMenuModel(name: "الصفحة الشخصية", id: "Profile"),
                                SideMenuModel(name: "القائمة", id: "Menu"),
                                SideMenuModel(name: "التنبيهات", id: "Notification"),
                                SideMenuModel(name: "الطلبات", id: "orders"),
                                SideMenuModel(name: "السلة", id: "Cart"),
                                SideMenuModel(name: "المفضلة", id: "Favorite"),
                                SideMenuModel(name: "تواصل معنا", id: "ContactUs"),
                                SideMenuModel(name: "الشروط و الأحكام", id: "Terms"),
                                SideMenuModel(name: "الإعدادات", id: "Settings"),
                                 SideMenuModel(name: "نسجيل خروج", id: "logOut")
                            ]
            } else {
                self.sideMenuArr = [
                                SideMenuModel(name: "Home", id: "Home"),
                                SideMenuModel(name: "Profile", id: "Profile"),
                                SideMenuModel(name: "Menu", id: "Menu"),
                                SideMenuModel(name: "Notification", id: "Notification"),
                                SideMenuModel(name: "orders", id: "orders"),
                                SideMenuModel(name: "Cart", id: "Cart"),
                                SideMenuModel(name: "Favorite", id: "Favorite"),
                                SideMenuModel(name: "Contact Us", id: "ContactUs"),
                                SideMenuModel(name: "Terms and Conditions", id: "Terms"),
                                SideMenuModel(name: "Settings", id: "Settings"),
                                SideMenuModel(name: "Log out", id: "logOut")
                            ]
            }
//        } else {
//            if "lang".localized == "ar" {
//                self.sideMenuArr = [
//                                SideMenuModel(name: "الصفحة الرئيسية", id: "Home"),
//                                SideMenuModel(name: "تواصل معنا", id: "ContactUs"),
//                                SideMenuModel(name: "الشروط و الأحكام", id: "Terms"),
//                                SideMenuModel(name: "الإعدادات", id: "Settings"),
//                                SideMenuModel(name: "الشروط و الأحكام", id: "Terms"),
//                                SideMenuModel(name: "نسجيل دخول", id: "login")
//                            ]
//            } else {
//                self.sideMenuArr = [
//                                SideMenuModel(name: "Home", id: "Home"),
//                                SideMenuModel(name: "Contact Us", id: "ContactUs"),
//                                SideMenuModel(name: "Settings", id: "Settings"),
//                                SideMenuModel(name: "Terms and Conditions", id: "Terms"),
//                                SideMenuModel(name: "Log in", id: "login")
//
//                            ]
//            }
//        }
        
    }
    

    
    func pushViewController(Storyboard name: String, forController identifier: String) {
        let main = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(main, animated: true)
    }
    
}
//MARK:- Bind TableView and TableView Functions
extension SideMenuVC: UITableViewDelegate {
    func bindTableView() {
        
        sideMenuTableView.rx.setDelegate(self).disposed(by: disposeBag)
        sideMenuTableView.delegate = self
        sideMenuTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        _ = sideMenuViewModel.sideMenuArr.bind(to: sideMenuTableView.rx.items(cellIdentifier: cellIdentifier, cellType: SideMenuCell.self)) {
            index, element , cell in
            
            cell.config(sideMenuName: element.name)
            }.disposed(by: disposeBag)
        
        sideMenuTableView.rx.modelSelected(SideMenuModel.self).subscribe(onNext: { (SideMenuModel) in
            self.SelectionAction(SideMenuId: SideMenuModel.id)
        }).disposed(by: disposeBag)

        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    //MARK:- Selection Action
    func SelectionAction(SideMenuId: String) {
        switch SideMenuId {
        case "Home":
            pushViewController(Storyboard: "Main", forController: "HomeVC")
        case "Cart":
            pushViewController(Storyboard: "Cart", forController: "CartVC")
        case "Profile":
            pushViewController(Storyboard: "Authentication", forController: "CustomerEDITProfileVC")
        case "Favorite":
            pushViewController(Storyboard: "Favourite", forController: "FavoritesVC")
        case "ContactUs":
            pushViewController(Storyboard: "AboutApp", forController: "HelpAndSupportingVC")
        case "Menu":
            pushViewController(Storyboard: "Favourite", forController: "MenuVC")
        case "Notification":
            pushViewController(Storyboard: "Main", forController: "NotificationVC")
        case "Settings":
            pushViewController(Storyboard: "AboutApp", forController: "SettingVC")
        case "orders":
            pushViewController(Storyboard: "Cart", forController: "OrderVC")
        case "Terms":
            pushViewController(Storyboard: "AboutApp", forController: "AboutAppVC")
        case "logOut":
            pushViewController(Storyboard: "Authentication", forController: "LoginVC")
        case "login":
            pushViewController(Storyboard: "Authentication", forController: "LoginVC")
        default:
            break
        }
    }
}
