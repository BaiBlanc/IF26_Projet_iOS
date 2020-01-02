//
//  CommandViewController.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 01/01/2020.
//  Copyright © 2020 白哲源. All rights reserved.
//

import UIKit

class CommandViewController: UIViewController {

    var commande:Commande? = nil
    var price:Float = 0.0
    let sections = ["Plat","Entree","Accompagnement","Dessert","Boisson"]
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var priceLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.calculatePrice()
        self.priceLable.text = "$\(self.price)"
    }
    
    @IBAction func payOnClick(_ sender: UIButton) {
        print("Close")
        dismiss(animated: true, completion: nil)
        pay()
    }
    func pay(){
        
        commande?.affiche()
        let today = Date()
        self.commande?.sendData(timestamp: today, price: self.price)
        self.commande?.fetchCommand()
    }
    
    func calculatePrice(){
        self.commande?.plats.forEach{item in
            if(item["price"] != nil){
                self.price += Float(item["price"]!)!*Float(item["quantity"]!)!
            }
        }
        self.commande?.entrees.forEach{item in
            if(item["price"] != nil){
                self.price += Float(item["price"]!)!*Float(item["quantity"]!)!
            }
        }
        self.commande?.accompagnements.forEach{item in
            if(item["price"] != nil){
                self.price += Float(item["price"]!)!*Float(item["quantity"]!)!
            }
        }
        self.commande?.desserts.forEach{item in
            if(item["price"] != nil){
                self.price += Float(item["price"]!)!*Float(item["quantity"]!)!
            }
        }
        self.commande?.boissons.forEach{item in
            if(item["price"] != nil){
                self.price += Float(item["price"]!)!*Float(item["quantity"]!)!
            }
        }
        
    }

}



extension CommandViewController:UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        switch section{
        case 0:
            return 1
        case 1:
            return self.commande!.entrees.count
        case 2:
            return self.commande!.accompagnements.count
        case 3:
            return self.commande!.desserts.count
        case 4:
            return self.commande!.boissons.count
        default:
            return 0
        }
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commandeCell", for: indexPath)
        var text:String = "-"
        switch indexPath.section{
        case 0:
            let item = self.commande?.plats[indexPath.row]
            if(item!["name"] != nil){
                text = "\(item!["name"]!)         x\(item!["quantity"]!)"
            }
        case 1:
            let item = self.commande?.entrees[indexPath.row]
            if(item!["name"] != nil){
                text = "\(item!["name"]!)         x\(item!["quantity"]!)"
            }
        case 2:
            let item = self.commande?.accompagnements[indexPath.row]
            if(item!["name"] != nil){
                text = "\(item!["name"]!)         x\(item!["quantity"]!)"
            }
        case 3:
            let item = self.commande?.desserts[indexPath.row]
            if(item!["name"] != nil){
                text = "\(item!["name"]!)         x\(item!["quantity"]!)"
            }
        case 4:
            let item = self.commande?.boissons[indexPath.row]
            if(item!["name"] != nil){
                text = "\(item!["name"]!)         x\(item!["quantity"]!)"
            }
        default:
            print("Extra section")
        }
        
        cell.detailTextLabel?.text = text
        cell.textLabel?.text = ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return self.sections[section]
    }
    
    
    
}
