//
//  HeaderMenuCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/22/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class HeaderMenuCell: UITableViewCell {

    @IBOutlet weak var ContentHeaderLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        ContentHeaderLabel.adjustsFontSizeToFitWidth = true
        ContentHeaderLabel.minimumScaleFactor = 0.5
    }
    
  func config(StepHeaderContent: String) {
  
    self.ContentHeaderLabel.text = StepHeaderContent
    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    }
    
}
