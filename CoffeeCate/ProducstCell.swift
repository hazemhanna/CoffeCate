//
//  ProducstCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//



import UIKit

class ProducstCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDetailsLabel: UILabel!
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var favouriteBtn : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 20
        productImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        ContentView.layer.masksToBounds = true
        ContentView.layer.shadowColor = UIColor.backgroundColor.cgColor
        ContentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        ContentView.layer.shadowRadius = 21.0
        ContentView.layer.shadowOpacity = 0.5
        ContentView.layer.masksToBounds = false
    }

    func config(productImageURL: String, productName: String,productDetails : String) {
        if productImageURL != "" {
//            guard let url = URL(string: "https://dev.fv.academy/public/files/" + categoryImageURL) else { return }
//            self.CategoryImageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "customer"))
        } else {
            self.productImageView.image = #imageLiteral(resourceName: "6011")
        }
         self.productNameLabel.text = productName
         self.productDetailsLabel.text = productDetails
    }
}
