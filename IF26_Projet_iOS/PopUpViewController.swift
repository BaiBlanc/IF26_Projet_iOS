//
//  PopUpViewViewController.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 08/12/2019.
//  Copyright © 2019 白哲源. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var commande:Commande? = nil

    @IBOutlet weak var beefButton: UIButton!
    @IBOutlet weak var porkButton: UIButton!
    @IBOutlet weak var chickenButton: UIButton!
    @IBOutlet weak var onionButton: UIButton!
    @IBOutlet weak var pepperButton: UIButton!
    @IBOutlet weak var hotButton: UIButton!
    @IBOutlet weak var garlicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.showAnimate()
        
        self.beefButton.isSelected = true
        self.onionButton.isSelected = true
        self.garlicButton.isSelected = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CloseOnClick(_ sender: UIButton) {
    //        self.view.removeFromSuperview()
        self.savePlat()
        self.removeAnimate()
    }
    
    @IBAction func cancelOnClick(_ sender: UIButton) {
        self.removeAnimate()
    }
    
    
    
    
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0,y: 1.0)
        })
        
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished: Bool) in
            if(finished){
                self.view.removeFromSuperview()
            }
        })
    }
    
    func savePlat(){
        let id:String = createId()
        let name: String = createName()
        let quantity: Int = 1
        
        commande?.ajoutePlat(plat: name, quantity: quantity, id: id, price: 15.0)
    }
    
    func createId() -> String{
        var id = ""
        
        if(beefButton.isSelected){
            id = "beef"
        }else if (chickenButton.isSelected){
            id = "chicken"
        }else if (porkButton.isSelected){
            id = "pork"
        }
        if(pepperButton.isSelected){
            id = "\(id)+pepper"
        }else if (onionButton.isSelected){
            id = "\(id)+onion"
        }
        if(garlicButton.isSelected){
            id = "garlic+\(id)"
        }else if(hotButton.isSelected){
            id = "hot+\(id)"
        }
        
        return id
        
    }
    func createName() -> String{
        var name = ""
        if(beefButton.isSelected){
            name = "Beef"
        }else if (chickenButton.isSelected){
            name = "Chicken"
        }else if (porkButton.isSelected){
            name = "Pork"
        }
        if(pepperButton.isSelected){
            name = "\(name) Pepper"
        }else if (onionButton.isSelected){
            name = "\(name) Onion"
        }
        if(garlicButton.isSelected){
            name = "Garlic \(name)"
        }else if(hotButton.isSelected){
            name = "Hot \(name)"
        }
        
        return name
    }
    
   
    

}
extension PopUpViewController{
    
    //Group buttons
    @IBAction func beefOnClick(_ sender: UIButton) {
        if (chickenButton.isSelected == true){
            chickenButton.isSelected = false
            beefButton.isSelected = true
        }else if(porkButton.isSelected == true){
            porkButton.isSelected = false
            beefButton.isSelected = true
            
        }else{
            beefButton.isSelected = true
        }
    }
    
    @IBAction func chickenOnClick(_ sender: Any) {
        if (beefButton.isSelected == true){
            chickenButton.isSelected = true
            beefButton.isSelected = false
        }else if(porkButton.isSelected == true){
            porkButton.isSelected = false
            chickenButton.isSelected = true
            
        }else{
            chickenButton.isSelected = true
        }
    }
    @IBAction func porkOnClick(_ sender: Any) {
        if (beefButton.isSelected == true){
            porkButton.isSelected = true
            beefButton.isSelected = false
        }else if(chickenButton.isSelected == true){
            porkButton.isSelected = true
            chickenButton.isSelected = false
            
        }else{
            porkButton.isSelected = true
        }
        
    }
    
        @IBAction func onionOnClick(_ sender: Any) {
               if pepperButton.isSelected {
                   pepperButton.isSelected = false
                   onionButton.isSelected = true
               }else{
                   onionButton.isSelected = true
               }
           }
           
           @IBAction func pepperOnClick(_ sender: Any) {
               if onionButton.isSelected {
                   onionButton.isSelected = false
                   pepperButton.isSelected = true
               }else{
                   pepperButton.isSelected = true
               }
           }
           @IBAction func garlicOnClick(_ sender: Any) {
               if hotButton.isSelected {
                   hotButton.isSelected = false
                   garlicButton.isSelected = true
               }else{
                   garlicButton.isSelected = true

               }
           }
           @IBAction func hotOnClick(_ sender: Any) {
               if garlicButton.isSelected {
                   garlicButton.isSelected = false
                   hotButton.isSelected = true
               }else{
                   hotButton.isSelected = true
               }
           }
}
