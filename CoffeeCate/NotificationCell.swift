//
//  NotificationCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    @IBOutlet weak var ContentView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
     
//        ContentView.layer.masksToBounds = true
//        ContentView.layer.shadowColor = UIColor.backgroundColor.cgColor
//        ContentView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        ContentView.layer.shadowRadius = 21.0
//        ContentView.layer.shadowOpacity = 0.5
//        ContentView.layer.masksToBounds = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
