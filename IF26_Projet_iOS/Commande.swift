//
//  Command.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 20/12/2019.
//  Copyright © 2019 白哲源. All rights reserved.
//

import Foundation

class Commande{
    var boisssons = [Dictionary<String,String>()]
    var plats = [Dictionary<String,String>()]
    var accompagnements = [Dictionary<String,String>()]
    var desserts = [Dictionary<String,String>()]
    var entrees = [Dictionary<String,String>()]
    init(){
        
    }
    
    func ajouteBoisson(boisson:String, quantity:Int){
        if(self.boisssons.count == 0 || boisssons[0] == [:]){
            self.boisssons[0] = ["name":boisson, "quantity":String(quantity)]
        }else{
            self.boisssons.append(["name":boisson, "quantity":String(quantity)])

        }
    }
    func ajoutePlat(plat:String, quantity:Int){
        if(self.plats.count == 0 || plats[0] == [:]){
            self.plats[0] = ["name":plat, "quantity":String(quantity)]
        }else{
            self.plats.append(["name":plat, "quantity":String(quantity)])

        }
    }
    func ajouteAccompagnement(accompagnement:String, quantity:Int){
        if(self.accompagnements.count == 0 || accompagnements[0] == [:]){
            self.accompagnements[0] = ["name":accompagnement, "quantity":String(quantity)]
        }else{
            self.accompagnements.append(["name":accompagnement, "quantity":String(quantity)])

        }
    }
    func ajouteEntree(entree:String, quantity:Int){
        if(self.entrees.count == 0 || entrees[0] == [:]){
            self.entrees[0] = ["name":entree, "quantity":String(quantity)]
        }else{
            self.entrees.append(["name":entree, "quantity":String(quantity)])

        }
    }
    func ajouteDessert(dessert:String, quantity:Int){
        if(self.desserts.count == 0 || desserts[0] == [:]){
            self.desserts[0] = ["name":dessert, "quantity":String(quantity)]
        }else{
            self.desserts.append(["name":dessert, "quantity":String(quantity)])

        }
    }
}
