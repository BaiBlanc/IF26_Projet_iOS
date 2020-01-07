//
//  MenuViewController.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 26/11/2019.
//  Copyright © 2019 白哲源. All rights reserved.
//

import UIKit
import CoreData

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let categories = ["PLAT","ENTREE","ACCOMPAGNEMENT","DESSERT","BOISSON"]
    var plats: [Any]?
    var commande:Commande? = nil
    var boissons = [Dictionary<String,String>()]
    var accompagnements = [Dictionary<String,String>()]
    var desserts = [Dictionary<String,String>()]
    var entrees = [Dictionary<String,String>()]
    @IBOutlet weak var Right_TableView: UITableView!
    @IBOutlet weak var Left_TableView: UITableView!
    
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var PlatImageView: UIImageView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.commande = Commande()
            self.initialiseMenu()
            self.fetchMenu()
            self.constructMenuDict()
            self.printMenu()
            Left_TableView.rowHeight = 80
            Left_TableView.dataSource = self
            Left_TableView.delegate = self
            Left_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    //        Left_TableView.register(SectionTableViewCell.self, forCellReuseIdentifier: "sectionCell")
            Right_TableView.rowHeight = 100
            Right_TableView.dataSource = self
            Right_TableView.delegate = self
            Right_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    //        Right_TableView.register(PlatTableViewCell.self, forCellReuseIdentifier: "platCell")
            // Do any additional setup after loading the view.
        
            
        }
   
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var count:Int?
        if tableView == self.Left_TableView {
            count = 1
        }
        
        if tableView == self.Right_TableView {
            count =  self.categories.count
        }
        return count!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        
        if tableView == self.Left_TableView {
            count = self.categories.count
        }
        
        if tableView == self.Right_TableView {
            switch section{
            case 0:
                count = 1
            case 1:
                count = self.entrees.count
            case 2:
                count = self.accompagnements.count
            case 3:
                count = self.desserts.count
            case 4:
                count = self.boissons.count
                  
            default:
                count = 0
                
            }
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.Left_TableView {
             let cell: SectionTableViewCell = Left_TableView.dequeueReusableCell(withIdentifier: SectionTableViewCell.identifier, for: indexPath) as! SectionTableViewCell
            //                else {
            //                fatalError("Unexpected Index Path")
            //            }
//                        cell.sectionLabel.text = "Section "+String(previewDetail)
            cell.sectionLabel.text = categories[indexPath.row]
                        
                        return cell

            
            
        }
        
        else {// tableView == self.Right_TableView{
            
            let cell:PlatTableViewCell = tableView.dequeueReusableCell(withIdentifier: PlatTableViewCell.identifier, for: indexPath) as! PlatTableViewCell
            //                else {
            //
            //                fatalError("Unexpected Index Path")
            //            }
            //let CellIdentifier:String = "identifier\(indexPath.section)-\(indexPath.row)"
            
            cell.sendSuperController(self)
            cell.commande = self.commande
            cell.section = indexPath.section
            if(indexPath.section == 0){
                cell.addButton.isHidden = true
                cell.detailButton.isHidden = false
                cell.quantityLabel.isHidden = true
                cell.minusButton.isHidden = true
                cell.platLabel.text = "Plat"
                cell.priceLabel.text = "Price"
            }else {
                cell.addButton.isHidden = false
                cell.minusButton.isHidden = true
                cell.detailButton.isHidden = true
                cell.quantityLabel.isHidden = false
//                cell.quantityLabel.text = String(self.commande?.getQuantity(category: category, id: id))
                switch indexPath.section{
                case 1:
                    if self.entrees.count > 0 {
                        var i = self.entrees[indexPath.row]
                        cell.platLabel.text = i["name"]
                            cell.priceLabel.text = i["price"]
                        cell.idLabel.text = i["id"]
                        cell.updateQuantity(section:indexPath.section,id:i["id"]!)
                }
                    
                case 2:
                if self.accompagnements.count > 0 {
                    var i = self.accompagnements[indexPath.row]
                        cell.platLabel.text = i["name"]
                        cell.priceLabel.text = i["price"]
                    cell.idLabel.text = i["id"]
                    cell.updateQuantity(section:indexPath.section,id:i["id"]!)


                }
                case 3:
                    if self.desserts.count > 0 {
                        var i = self.desserts[indexPath.row]
                            cell.platLabel.text = i["name"]
                            cell.priceLabel.text = i["price"]
                        cell.idLabel.text = i["id"]
                        cell.updateQuantity(section:indexPath.section,id:i["id"]!)


                    }
                case 4:
                    if self.boissons.count > 0 {
                        var i = self.boissons[indexPath.row]
                            cell.platLabel.text = i["name"]
                            cell.priceLabel.text = i["price"]
                        cell.idLabel.text = i["id"]
                        cell.updateQuantity(section:indexPath.section,id:i["id"]!)


                    }
                default:
                    print("Too many sections")
                }
                
            }
            
            return cell
           
        }
        
        
    }
    
    func tableView (_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if(tableView == Right_TableView){
            return self.categories[section]
        }
        return "Categorie"
    }
    
    
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if (tableView == self.Left_TableView) {
            
            var moveToIndexPath:IndexPath = IndexPath(row:0, section:indexPath.row) 
            
            // 将右侧 tableView 移动到指定位置
            self.Right_TableView.selectRow(at: moveToIndexPath, animated: true, scrollPosition: UITableView.ScrollPosition.top)
            //selectRowAtIndexPath:moveToIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
            
            // 取消选中效果
            self.Right_TableView.deselectRow(at: moveToIndexPath, animated: true)
                //deselectRowAtIndexPath:moveToIndexPath animated:YES];
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView == Right_TableView){
            
            var headIndexPath:IndexPath =             (self.Right_TableView.indexPathsForVisibleRows?[0])!
            var moveToIndexPath:IndexPath = IndexPath(row:headIndexPath.section, section:0) 
            self.Left_TableView.selectRow(at: moveToIndexPath, animated: true, scrollPosition: UITableView.ScrollPosition.top)
        }
    }
    
    @IBAction func payOnClick(_ sender: UIButton) {
        self.commande?.affiche()
        performSegue(withIdentifier: "passCommand", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CommandViewController
        vc.commande = self.commande!
        vc.menuTableview = self.Right_TableView
    }

}
extension MenuViewController{
    func initialiseMenu(){
        let menu = Menu()
        menu.addTestData()
        
    }
    
    func fetchMenu()  {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Plat")
        request.returnsObjectsAsFaults = false
        do{
            self.plats = try context.fetch(request)
            
        }catch{
            print("Error: impossible to fetch the request")
        }
     
    }
    func constructMenuDict(){
        if self.plats!.count > 0 {
            for plat in self.plats as! [Plat]{
                switch plat.category!{
                case "ENTREE":
                    if(self.entrees[0] == [:]){
                       self.entrees[0] = ["id":plat.id!,"name":plat.name!,"price":String(plat.price)]
                   }else{
                       self.entrees.append(["id":plat.id!,"name":plat.name!,"price":String(plat.price)])
                   }
                case "ACCOMPAGNEMENT":
                    if(self.accompagnements[0] == [:]){
                        self.accompagnements[0] = ["id":plat.id!,"name":plat.name!,"price":String(plat.price)]
                    }else{
                        self.accompagnements.append(["id":plat.id!,"name":plat.name!,"price":String(plat.price)])
                    }
                   
                case "DESSERT":
                     if(self.desserts[0] == [:]){
                           self.desserts[0] = ["id":plat.id!,"name":plat.name!,"price":String(plat.price)]
                       }else{
                           self.desserts.append(["id":plat.id!,"name":plat.name!,"price":String(plat.price)])
                       }
                    
                case "BOISSON":
                    
                    if(self.boissons[0] == [:]){
                          self.boissons[0] = ["id":plat.id!,"name":plat.name!,"price":String(plat.price)]
                      }else{
                          self.boissons.append(["id":plat.id!,"name":plat.name!,"price":String(plat.price)])
                      }
                default:
                    var plat_id:String = ""
                     var plat_name:String = ""
                     var plat_price:String = ""
                    if let id = plat.value(forKey: "id") as? String{
                        plat_id = id
                    }
                    if let price = plat.value(forKey: "price") as? String{
                        plat_price = price
                    }
                    if let name = plat.value(forKey: "name") as? String{
                        plat_name = name
                    }
                    print("Error: Category no correspondant")
                    print(plat)
                
               }
               
           }
       }
    }
    func printMenu(){
        
        
        
        print("Boissons")
        print(self.boissons)
        for i in self.boissons as [Dictionary<String,String>]{
            
            print("name: \(i["name"]!) price: \(i["price"]!)")
        }
        print(self.entrees)

        print("Entrees")
        for i in self.entrees as [Dictionary<String,String>]{
            
            print("name: \(i["name"]!) price: \(i["price"]!)")
        }
        print("Accopagnements")
        for i in self.accompagnements as [Dictionary<String,String>]{
            
            print("name: \(i["name"]!) price: \(i["price"]!)")
        }
        print("Desserts")
        for i in self.desserts as [Dictionary<String,String>]{
             
            print("name: \(i["name"]!) price: \(i["price"]!)")
        }
    }
    
    func updatePlat(plat:String){
        self.textLabel.text = plat
    }
    
}
