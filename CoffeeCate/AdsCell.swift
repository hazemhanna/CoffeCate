//
//  AdsCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/4/20.
//  Copyright © 2020 MAC. All rights reserved.
//


import UIKit
import Kingfisher

class AdsCell: UICollectionViewCell {

    
  
    @IBOutlet weak var imageView: CustomView!
    
    @IBOutlet weak var adImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    func config(imageURL: String?) {
//            if let imagePath = imageURL {
//                guard let imageURL = URL(string: BASE_URL + "/" + imagePath) else { return }
//                self.adImageView.kf.setImage(with: imageURL)
//            }
        
    }
 
    
}
