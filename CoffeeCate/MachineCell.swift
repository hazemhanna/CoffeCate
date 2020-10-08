//
//  MachineCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/7/20.
//  Copyright © 2020 MAC. All rights reserved.
//



import UIKit

class MachineCell: UITableViewCell {
    @IBOutlet weak var ContentView: UIView!
    var openGoogleMap: (() -> Void)? = nil

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        ContentView.layer.borderWidth = 2
        ContentView.layer.borderColor = UIColor.rgb(228, green: 218, blue: 202).cgColor
        ContentView.layer.cornerRadius = 20.0

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func openGoogle(_ sender: UIButton) {
           openGoogleMap?()
       }
    
    
}
