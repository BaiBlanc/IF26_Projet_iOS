//
//  Command.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 20/12/2019.
//  Copyright © 2019 白哲源. All rights reserved.
//

import Foundation

import CoreData
import UIKit


class Commande{
    var boissons = [Dictionary<String,String>()]
    var plats = [Dictionary<String,String>()]
    var accompagnements = [Dictionary<String,String>()]
    var desserts = [Dictionary<String,String>()]
    var entrees = [Dictionary<String,String>()]
    
    let app:AppDelegate
    let context:NSManagedObjectContext
    init(){
        app = UIApplication.shared.delegate as! AppDelegate
        context = app.persistentContainer.viewContext
    }
    
    func ajouteBoisson(boisson:String, quantity:Int,id:String, price:Float){
        if(self.boissons.count == 0){
            self.boissons.append(["name":boisson, "quantity":String(quantity),"id":id,"price":String(price)])
        } else if( boissons[0] == [:]){
            
            self.boissons[0] = ["name":boisson, "quantity":String(quantity),"id":id,"price":String(price)]
            
        }else{
            if(self.boissons.contains{
                (item) -> Bool in
                return item["name"] == boisson
            }){
                let index = self.boissons.index(where: {item -> Bool in
                    return item["name"]==boisson})!
                let new_quantity = Int(self.boissons[index]["quantity"]!)!+quantity
                if(new_quantity == 0){
                    self.boissons.remove(at: index)
                }else{
                    self.boissons[index]["quantity"] = String(new_quantity)
                }
            }else{
                
                self.boissons.append(["name":boisson, "quantity":String(quantity),"id":id,"price":String(price)])
            }
            

        }
    }
    func ajoutePlat(plat:String, quantity:Int,id:String, price:Float){
        if(self.plats.count == 0){
             self.plats.append(["name":plat, "quantity":String(quantity),"id":id,"price":String(price)])
        }else if( self.plats[0] == [:]){
            
            self.plats[0] = ["name":plat, "quantity":String(quantity),"id":id,"price":String(price)]
            
        }else{
            
            self.plats.append(["name":plat, "quantity":String(quantity),"id":id,"price":String(price)])

        }
        
        
    }
    func ajouteAccompagnement(accompagnement:String, quantity:Int,id:String, price:Float){
        if(self.accompagnements.count == 0){
            self.accompagnements.append(["name":accompagnement, "quantity":String(quantity),"id":id,"price":String(price)])
        } else if( accompagnements[0] == [:]){
            
            self.accompagnements[0] = ["name":accompagnement, "quantity":String(quantity),"id":id,"price":String(price)]
            
        }else{
            if(self.accompagnements.contains{
                (item) -> Bool in
                return item["name"] == accompagnement
            }){
                let index = self.accompagnements.index(where: {item -> Bool in
                    return item["name"]==accompagnement})!
                let new_quantity = Int(self.accompagnements[index]["quantity"]!)!+quantity
                if(new_quantity == 0){
                    self.accompagnements.remove(at: index)
                }else{
                    self.accompagnements[index]["quantity"] = String(new_quantity)
                }
                
            }else{
                self.accompagnements.append(["name":accompagnement, "quantity":String(quantity),"id":id,"price":String(price)])
            }
        }
    }
    func ajouteEntree(entree:String, quantity:Int,id:String, price:Float){
        if(self.entrees.count == 0){
            self.entrees.append(["name":entree, "quantity":String(quantity),"id":id,"price":String(price)])
        } else if( entrees[0] == [:]){
            
            self.entrees[0] = ["name":entree, "quantity":String(quantity),"id":id,"price":String(price)]
            
        }else{
            if(self.entrees.contains{
                (item) -> Bool in
                return item["name"] == entree
            }){
                let index = self.entrees.index(where: {item -> Bool in
                    return item["name"]==entree})!
                let new_quantity = Int(self.entrees[index]["quantity"]!)!+quantity
                if(new_quantity == 0){
                    self.entrees.remove(at: index)
                }else{
                    self.entrees[index]["quantity"] = String(new_quantity)
                }
            }else{
                self.entrees.append(["name":entree, "quantity":String(quantity),"id":id,"price":String(price)])
            }
        }
    }
    func ajouteDessert(dessert:String, quantity:Int,id:String, price:Float){
        if(self.desserts.count == 0){
            self.desserts.append(["name":dessert, "quantity":String(quantity),"id":id,"price":String(price)])
        } else if( desserts[0] == [:]){
            
            self.desserts[0] = ["name":dessert, "quantity":String(quantity),"id":id,"price":String(price)]
            
        }else{
            if(self.desserts.contains{
                (item) -> Bool in
                return item["name"] == dessert
            }){
                let index = self.desserts.index(where: {item -> Bool in
                    return item["name"]==dessert})!
                let new_quantity = Int(self.desserts[index]["quantity"]!)!+1
                if(new_quantity == 0){
                    self.desserts.remove(at: index)
                }else{
                    self.desserts[index]["quantity"] = String(new_quantity)
                }
            }else{
                self.desserts.append(["name":dessert, "quantity":String(quantity),"id":id,"price":String(price)])
            }
        }
    }
    
    func getQuantity(category:String, id:String) -> Int{
        
        switch category{
        case "accompagements":
            let index = self.accompagnements.firstIndex(where: {item -> Bool in
            return item["id"]==id})
            return index==nil ? 0 : Int(self.accompagnements[index!]["quantity"]!)!
        case "boissons":
            let index = self.boissons.firstIndex(where: {item -> Bool in
            return item["id"]==id})
            return index==nil ? 0 : Int(self.boissons[index!]["quantity"]!)!

        case "desserts":
            let index = self.desserts.firstIndex(where: {item -> Bool in
            return item["id"]==id})
            return index==nil ? 0 : Int(self.desserts[index!]["quantity"]!)!

        case "entrees":
            let index = self.entrees.firstIndex(where: {item -> Bool in
            return item["id"]==id})
            return index==nil ? 0 : Int(self.entrees[index!]["quantity"]!)!

        default:
            print("No such category id:\(id) category: \(category)")
            return -1
        }
         
    }
    
    func reset(){
        self.accompagnements.removeAll()
        self.boissons.removeAll()
        self.desserts.removeAll()
        self.entrees.removeAll()
        self.plats.removeAll()
    }
    
    func affiche(){
        print("---------Start Command---------------")
        print(self.accompagnements)
        print(self.boissons)
        print(self.desserts)
        print(self.entrees)
        print(self.plats)
        print("-----------End---------------")

    }
}

extension Commande{
    func sendData(timestamp: Date, price:Float){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Command")
        
        request.returnsObjectsAsFaults = false
        let command = NSEntityDescription.insertNewObject(forEntityName: "Command",into: context) as! Command
        command.plats = self.plats as NSObject
        command.entrees = self.entrees as NSObject
        command.accompagnements = self.accompagnements as NSObject
        command.desserts = self.desserts as NSObject
        command.boissons = self.boissons as NSObject
        command.timestamp = dateFormatter.string(from: timestamp)
        command.price = price
        do{
            try context.save()
            print("saved")
        }catch{
            print("Error: impossible to fetch the request")
        }
        
        
    }
    
    func fetchCommand() -> [(time:String,detail:String)] {
        var commandInfos = [(time:String,detail:String)]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Command")
        request.returnsObjectsAsFaults = false
        do{
            let command = try context.fetch(request)
            if(command.count != 0){
                for c in command as! [Command]{
                    var commandDetail = ""
                    let plats = c.plats as! [Dictionary<String,String>]
                    let boissons = c.boissons as! [Dictionary<String,String>]
                    let accompagnements = c.accompagnements as! [Dictionary<String,String>]
                    let desserts = c.desserts as! [Dictionary<String,String>]
                    let entrees = c.entrees as! [Dictionary<String,String>]
                    let timestamp = c.timestamp!
                    let price = c.price
                    
                    
                    print(timestamp)
                    
                    if(plats.count>0 && plats[0] != [:]){
                        for item in plats{
                            commandDetail = "\(commandDetail)\n\(item["id"]!) \(item["name"]!) \(item["price"]!) x\(item["quantity"]!)"
                            print(item["id"]!,item["name"]!,item["price"]!," x",item["quantity"]!)
                        }
                    }
                    if(boissons.count>0 && boissons[0] != [:]){
                        for item in boissons{
                            commandDetail = "\(commandDetail)\n\(item["id"]!) \(item["name"]!) \(item["price"]!) x\(item["quantity"]!)"
                            print(item["id"]!,item["name"]!,item["price"]!," x",item["quantity"]!)
                        }
                    }
                    
                    if(accompagnements.count>0 && accompagnements[0] != [:]){
                        for item in accompagnements{
                            commandDetail = "\(commandDetail)\n\(item["id"]!) \(item["name"]!) \(item["price"]!) x\(item["quantity"]!)"
                            print(item["id"]!,item["name"]!,item["price"]!," x",item["quantity"]!)
                        }
                    }
                    
                    if(desserts.count>0 && desserts[0] != [:]){
                        for item in desserts{
                            commandDetail = "\(commandDetail)\n\(item["id"]!) \(item["name"]!) \(item["price"]!) x\(item["quantity"]!)"
                            print(item["id"]!,item["name"]!,item["price"]!," x",item["quantity"]!)
                        }
                    }

                    if(entrees.count>0 && entrees[0] != [:]){
                        for item in entrees{
                            commandDetail = "\(commandDetail)\n\(item["id"]!) \(item["name"]!) \(item["price"]!) x\(item["quantity"]!)"
                            print(item["id"]!,item["name"]!,item["price"]!," x",item["quantity"]!)
                        }
                    }
                    
                    commandDetail = "\(commandDetail)\n$ \(price)"
                    print("$ \(price)")
                    
                    
                    commandInfos.insert((timestamp,commandDetail), at: 0)

                }
                
            }
        }catch{
            print("Error: impossible to fetch the request")
        }
        return commandInfos
    }

}
