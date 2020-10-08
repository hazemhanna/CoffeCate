//
//  SettingCell.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import Kingfisher
class SupportingCell: UITableViewCell {
    
    @IBOutlet weak var section_image: UIImageView!
    @IBOutlet weak var section_name: UIButton!
    var selectionAction: (() -> Void)? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        section_image.setRounded()
        if "lang".localized == "ar" {
            self.section_name.contentHorizontalAlignment = .right
        } else {
            self.section_name.contentHorizontalAlignment = .left
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(imagePath: UIImage, name: String) {
        self.section_image.image = imagePath
        self.section_name.setTitle(name, for: .normal)
    }
    
    @IBAction func SectionAction(_ sender: UIButton) {
        selectionAction?()
    }
}
