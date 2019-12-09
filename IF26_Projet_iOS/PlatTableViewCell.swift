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
    var superController:UIViewController? = nil
    @IBOutlet weak var platImage: UIImageView!
    
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var platLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    func sendSuperController(_ superController:UIViewController){
        self.superController = superController
    }
    
    @IBAction func detailOnClick(_ sender: UIButton) {
        print("hhhh")
        let popUpVC = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "detailPopUpID") as! PopUpViewController
        
        
        self.superController?.addChild(popUpVC)
        popUpVC.view.frame = self.superController?.view.frame as! CGRect
        self.superController?.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: self.superController)
        //todo chage alpha透明度 添加内容 关闭按钮
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.addButton.layer.masksToBounds = true
        self.addButton.layer.cornerRadius = self.addButton.frame.size.width/2
        //self.addButton.layer.cornerRadius = 45.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
