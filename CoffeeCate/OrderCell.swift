//
//  OrderCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/7/20.
//  Copyright © 2020 MAC. All rights reserved.
//




import UIKit

class OrderCell : UITableViewCell {

    @IBOutlet weak var QuantityStackView: UIStackView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var ContentView: UIView!

    
    
    
    var increaseQuantity: (() -> Void)? = nil
    var decreaseQuantity: (() -> Void)? = nil
    var deleteActiion: (() -> Void)? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
   
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10
        productImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        ContentView.layer.borderWidth = 2
        ContentView.layer.borderColor = UIColor.rgb(228, green: 218, blue: 202).cgColor
        ContentView.layer.cornerRadius = 10.0


        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config(ProductImageURL: String, ProductName: String,ProductCount: String,Price: Double,Productsize: String,sugar: String) {
        if ProductImageURL != "" {
            guard let imageURL = URL(string: BASE_URL + ProductImageURL) else { return }
            self.productImageView.kf.setImage(with: imageURL)
        }
        self.productNameLabel.text = ProductName
        self.counterLabel.text = ProductCount
    
    }
    @IBAction func decreaseAction(_ sender: UIButton) {
        decreaseQuantity?()
    }
    @IBAction func increaseAction(_ sender: UIButton) {
        increaseQuantity?()
    }
    @IBAction func DeleteAction(_ sender: UIButton) {
        deleteActiion?()
    }
    
}


