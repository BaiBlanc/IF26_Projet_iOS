//
//  PlatTableViewCell.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 05/12/2019.
//  Copyright © 2019 白哲源. All rights reserved.
//

import UIKit

class PlatTableViewCell: UITableViewCell {

    static let identifier = "platCell"
    @IBOutlet weak var platImage: UIImageView!
    
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var platLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addButton.layer.masksToBounds = true
        self.addButton.layer.cornerRadius = 45.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
