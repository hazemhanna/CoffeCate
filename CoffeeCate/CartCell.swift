//
//  CartCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//



import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var QuantityStackView: UIStackView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var ContentView: UIView!
    
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    
    var increaseQuantity: (() -> Void)? = nil
    var decreaseQuantity: (() -> Void)? = nil
    var deleteActiion: (() -> Void)? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        productNameLabel.adjustsFontSizeToFitWidth = true
//        productNameLabel.minimumScaleFactor = 0.5
//        counterLabel.adjustsFontSizeToFitWidth = true
//        counterLabel.minimumScaleFactor = 0.5
//        PriceLabel.minimumScaleFactor = 0.5

        
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10
        productImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
              
         ContentView.layer.borderWidth = 2
         ContentView.layer.borderColor = UIColor.rgb(228, green: 218, blue: 202).cgColor
         ContentView.layer.cornerRadius = 10.0
        ContentView.layer.masksToBounds = true
        ContentView.layer.shadowColor = UIColor.backgroundColor.cgColor
        ContentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        ContentView.layer.shadowRadius = 21.0
        ContentView.layer.shadowOpacity = 0.5
        ContentView.layer.masksToBounds = false

        
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

