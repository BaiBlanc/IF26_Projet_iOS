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
    var commande:Commande? = nil
    var section:Int = 0
    
    @IBOutlet weak var platImage: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var platLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configValue(section:Int,q:Int,plat:String,id:String,price:Float){
        
    }
    func sendSuperController(_ superController:UIViewController){
        self.superController = superController
    }
    
    @IBAction func minusOnClick(_ sender: UIButton) {
        let dict = [1:"entrees",2:"accompagements",3:"desserts",4:"boissons"]
        let category:String = dict[self.section]!
        let name = platLabel.text as! String
        let price = Float(priceLabel.text as! String)
        let id:String = idLabel.text!
        
        switch category{
        case "entrees":
            self.commande?.ajouteEntree(entree: name, quantity: -1, id: id, price: price!)
        case "accompagements":
            self.commande?.ajouteAccompagnement(accompagnement: name, quantity: -1, id: id, price: price!)
        case "desserts":
            self.commande?.ajouteDessert(dessert: name, quantity: -1, id: id, price: price!)
        case "boissons":
            self.commande?.ajouteBoisson(boisson: name, quantity: -1, id: id, price: price!)
        default:
            print("No such section:", section)
        }
        
        let quantity:Int = (commande?.getQuantity(category: category, id: id))!
        self.quantityLabel.text = String(quantity)
        if(quantity <= 0){
            self.minusButton.isHidden = true

        }
    }
    
    @IBAction func plusObClick(_ sender: UIButton) {
        let dict = [1:"entrees",2:"accompagements",3:"desserts",4:"boissons"]
        let category:String = dict[self.section]!
        let name = platLabel.text as! String
        let price = Float(priceLabel.text as! String)
        let id:String = idLabel.text!
        
        switch category{
        case "entrees":
            self.commande?.ajouteEntree(entree: name, quantity: 1, id: id, price: price!)
        case "accompagements":
            self.commande?.ajouteAccompagnement(accompagnement: name, quantity: 1, id: id, price: price!)
        case "desserts":
            self.commande?.ajouteDessert(dessert: name, quantity: 1, id: id, price: price!)
        case "boissons":
            self.commande?.ajouteBoisson(boisson: name, quantity: 1, id: id, price: price!)
        default:
            print("No such section:", section)
        }
        
        let quantity:Int = (commande?.getQuantity(category: category, id: id))!
        self.quantityLabel.text = String(quantity)
        self.minusButton.isHidden = false

        
//        print(self.quantity)
//        self.updateQuantity()
    }
    @IBAction func detailOnClick(_ sender: UIButton) {
        print("hhhh")
        let popUpVC = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "detailPopUpID") as! PopUpViewController
        
        
        self.superController?.addChild(popUpVC)
        popUpVC.view.frame = self.superController?.view.frame as! CGRect
        self.superController?.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: self.superController)
        popUpVC.commande = self.commande
        
    }
    func updateQuantity(section:Int,id:String){
        let dict = [1:"entrees",2:"accompagements",3:"desserts",4:"boissons"]
        let category:String = dict[section]!
        let quantity:Int = (commande?.getQuantity(category: category, id: id))!
        self.quantityLabel.text = String(quantity)
        if(quantity > 0){
            self.minusButton.isHidden = false
        }else{
            self.minusButton.isHidden = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.addButton.layer.masksToBounds = true
        self.quantityLabel.text = String(0)
        self.detailButton.layer.cornerRadius = self.addButton.frame.size.width/8
        self.addButton.layer.cornerRadius = self.addButton.frame.size.width/2
        self.minusButton.layer.cornerRadius = self.addButton.frame.size.width/2
        //self.addButton.layer.cornerRadius = 45.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
