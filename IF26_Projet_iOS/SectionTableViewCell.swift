//
//  SectionTableViewCell.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 05/12/2019.
//  Copyright © 2019 白哲源. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    @IBOutlet weak var sectionLabel: UILabel!
    static let identifier = "sectionCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
