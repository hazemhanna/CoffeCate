//
//  SideMenuCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//




import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet weak var sideMenuImageView: UIImageView!
    @IBOutlet weak var sideMenuLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sideMenuLabel.adjustsFontSizeToFitWidth = true
        sideMenuLabel.minimumScaleFactor = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config(sideMenuName: String) {
        self.sideMenuLabel.text = sideMenuName
    }
}
