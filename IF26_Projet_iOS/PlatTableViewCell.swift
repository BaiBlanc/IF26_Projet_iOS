//
//  PlatTableViewCell.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 05/12/2019.
//  Copyright © 2019 白哲源. All rights reserved.
//

import UIKit

class PlatTableViewCell: UITableViewCell {

    var quantity:Int = 0
    static let identifier = "platCell"
    var superController:UIViewController? = nil
    @IBOutlet weak var platImage: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var platLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    func sendSuperController(_ superController:UIViewController){
        self.superController = superController
    }
    
    @IBAction func minusOnClick(_ sender: UIButton) {
        if (self.quantity>0){
            self.quantity -= 1
        }
        self.updateQuantity()
    }
    
    @IBAction func plusObClick(_ sender: UIButton) {
        self.quantity += 1
        
        print(self.platLabel.text,"+1")
        print(self.quantity)
        self.updateQuantity()
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
    func updateQuantity(){
        self.quantityLabel.text = String(self.quantity)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.addButton.layer.masksToBounds = true
        self.addButton.layer.cornerRadius = self.addButton.frame.size.width/2
        self.minusButton.layer.cornerRadius = self.addButton.frame.size.width/2
        //self.addButton.layer.cornerRadius = 45.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
