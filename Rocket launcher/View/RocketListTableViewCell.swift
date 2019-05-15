//
//  RocketListTableViewCell.swift
//  CaltexRocketApp
//
//  Created by Somya on 13/5/19.
//  Copyright © 2019 MobileDEN. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class RocketListTableViewCell: UITableViewCell {
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var rocketLocationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCellUI(with imageString: String, name: String, location: String) {
        self.rocketImageView.sd_setImage(with: URL(string: imageString), placeholderImage: #imageLiteral(resourceName: "placeholderRocket"))
        self.rocketNameLabel.text = name
        self.rocketLocationLabel.text = location
    }
}
