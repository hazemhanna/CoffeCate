//
//  MenuCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/21/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var ContentView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       ContentView.layer.borderWidth = 1
        ContentView.layer.borderColor = UIColor.lightGray.cgColor
     ContentView.layer.cornerRadius = 10.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
