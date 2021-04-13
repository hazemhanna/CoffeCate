//
//  HomeVC.swift
//  CoffeeCate
//
//  Created by MAC on 10/4/20.
//  Copyright © 2020 MAC. All rights reserved.
//



import UIKit
import RxSwift
import RxCocoa


let left_min_spacing: CGFloat = 10, center_min_spacing: CGFloat = 5, right_min_spacing: CGFloat = 10, categoryLabelHeight: CGFloat = 30

class HomeVC: UIViewController {
    
    @IBOutlet weak var searchTF: CustomTextField!
    @IBOutlet weak var adsCollectionView: CustomCollectionView!
    @IBOutlet weak var machineTableView: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var machineView : UIView!
    @IBOutlet weak var backButton: UIButton!

    
    var homeViewModel = HomeViewModel()
    
    var Ads = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.homeViewModel.fetchAds(AdsArr: self.Ads)
                let count = self.Ads.count
                self.pageControl.numberOfPages = count
                self.pageControl.isHidden = !(count > 1)
            }
        }
    }
    
    
    var machines = [String]() {
          didSet {
              DispatchQueue.main.async {
                self.homeViewModel.fetchMachines(mashine: self.machines)
              }
          }
      }
    
    
    private let adsCellIdentifier = "AdsCell"
      private let machineCellIdentifier = "MachineCell"
    
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        bindAdsCollectionView()
        bindMshinTableView()
    
        
        if "lang".localized == "ar" {
            self.backButton.setImage(#imageLiteral(resourceName: "back (11)-1"), for: .normal)
        } else {
           self.backButton.setImage(#imageLiteral(resourceName: "back (11)"), for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }

    
    @IBAction func sideMenuAction(_ sender: UIBarButtonItem) {
           self.setupSideMenu()
       }
    
    @IBAction func machineAction(_ sender: UIBarButtonItem) {
       
    }
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {

    }
  
    @IBAction func cartAction(_ sender: UIBarButtonItem) {
        //let main = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "CartVC")
        //self.navigationController?.pushViewController(main, animated: true)
        
        let main = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "MenuVC")
        self.navigationController?.pushViewController(main, animated: true)
        
    }
    
}

extension HomeVC: UICollectionViewDelegate {
    
    //MARK:- Bind AdsCollectionView
    func bindAdsCollectionView() {
        self.Ads = ["aaaa","aaaa","aaa","aaa","aaa"]
        adsCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        adsCollectionView.register(UINib(nibName: adsCellIdentifier, bundle: nil), forCellWithReuseIdentifier: adsCellIdentifier)
        
        homeViewModel.Ads.bind(to: adsCollectionView.rx.items(cellIdentifier: adsCellIdentifier, cellType: AdsCell.self)) { index, element, cell in
            cell.config(imageURL: "" )
            
        }.disposed(by: disposeBag)
        
        adsCollectionView.rx.itemSelected.bind(onNext: { (indexPath) in
            
        }).disposed(by: disposeBag)
        
    }//END of Binding AdsCollectionView
    
    
}


extension HomeVC: UITableViewDelegate {
    
    func bindMshinTableView() {
        self.machines = ["aa","aa"]
        machineTableView.rx.setDelegate(self).disposed(by: disposeBag)
        machineTableView.register(UINib(nibName: machineCellIdentifier, bundle: nil), forCellReuseIdentifier: machineCellIdentifier)
        homeViewModel.mashines.bind(to: machineTableView.rx.items(cellIdentifier: machineCellIdentifier, cellType: MachineCell.self)) { index, element, cell in
          //  cell.config(ProductImageURL: "", ProductName:  "asd", ProductCount: 0, oldPrice: product.price ?? 0.0, newPrice: discountedPrice, discountPercentage: productOffer.discount ?? 0.0, currency: Helper.getCurrentCurrency() ?? "", shipping: "FREE SHIPPING")
            
            cell.openGoogleMap = {
                self.openGoogleMap()
            }
            
            
        }.disposed(by: disposeBag)
        machineTableView.rx.itemSelected.bind { (indexPath) in
            guard let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MachineDetailsVC") as? MachineDetailsVC else { return }
            self.navigationController?.pushViewController(main, animated: true)
        }.disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    func openGoogleMap() {
    let latDouble =  Double(23.035007)
    let  longDouble =  Double(72.529324)
        
     if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {  //if phone has an app

         if let url = URL(string: "comgooglemaps-x-callback://?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving") {
                   UIApplication.shared.open(url, options: [:])
          }}
     else {
            //Open in browser
           if let urlDestination = URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving") {
                              UIApplication.shared.open(urlDestination)
                          }
               }

       }

    
}


extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == adsCollectionView {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        }else {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    
}
