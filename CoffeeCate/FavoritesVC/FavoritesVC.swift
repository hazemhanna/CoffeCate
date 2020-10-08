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

class FavoritesVC: UIViewController {

    @IBOutlet weak var productCollectionView : CustomCollectionView!
    
    private let favoriteProductCell = "FavoriteCell"
    var favoritesViewModel = FavoritesViewModel()
    var favoriteProducts = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.favoritesViewModel.fetchFavoriteProducts(products: self.favoriteProducts)
            }
        }
    }

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BindFavoritesCollectionView()
        getFavorites()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getCart()
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

//MARK:- Favorites TableView
extension FavoritesVC: UITableViewDelegate {
   func BindFavoritesCollectionView(){
        self.favoriteProducts = ["aaaa","aaaa","aaa","aaa","aaa","aaa","aaa","aaa","aaa","aaa","aaa","aaa","aaa"]
        let cellIdentifier = "ProducstCell"
        self.productCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        self.productCollectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        self.favoritesViewModel.FavoriteProducts.bind(to: self.productCollectionView.rx.items(cellIdentifier: cellIdentifier, cellType: ProducstCell.self)) { index, element, cell in
            cell.config(productImageURL: "", productName: "Coffee",productDetails : "LoremIpsumisimpldummytextotheprintingandtypesettingindustry.")
            cell.favouriteBtn.setImage(#imageLiteral(resourceName: "heart (4)"), for: .normal)
            
        }.disposed(by: disposeBag)
        self.productCollectionView.rx.itemSelected.bind { (indexPath) in
            //               guard let main = UIStoryboard(name: "Courses", bundle: nil).instantiateViewController(withIdentifier: "CoursesVC") as? CoursesVC else { return }
            //               main.category_id = self.Categories[indexPath.row].id ?? 0
            //               main.categoryName = self.Categories[indexPath.row].name ?? ""
            //               main.type = "category"
            //               self.navigationController?.pushViewController(main, animated: true)
        }.disposed(by: disposeBag)
    }
}

//MARK:- Retrieving Data
extension FavoritesVC {
    func getFavorites() {}
    func postAddOrRemoveFromFavorite(item_id: Int, item_type: String) {}
    func AddToCart(product_id: Int, quantity: Int) {}
    func RemoveFromCart(product_id: Int, quantity: Int) {}
    func getCart() {}
    
}


extension FavoritesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width - 20) / 2
        return CGSize(width: width , height:  width + 20)
    }
    
}
