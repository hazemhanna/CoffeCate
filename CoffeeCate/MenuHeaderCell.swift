//
//  MenuHeaderCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/21/20.
//  Copyright © 2020 MAC. All rights reserved.
//



import UIKit

class MenuHeaderCell: UITableViewCell {

    @IBOutlet weak var ContentHeaderLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ContentHeaderLabel.adjustsFontSizeToFitWidth = true
        ContentHeaderLabel.minimumScaleFactor = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config(StepHeaderContent: String) {
        self.ContentHeaderLabel.text = StepHeaderContent
    }
}
