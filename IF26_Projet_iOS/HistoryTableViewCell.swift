//
//  HistoryTableViewCell.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 02/01/2020.
//  Copyright © 2020 白哲源. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var commandLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
