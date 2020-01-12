//
//  Menu.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 10/12/2019.
//  Copyright © 2019 白哲源. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Menu{
    
    let categories = ["ENTREE","ACCOMPAGNEMENT","DESSERT","BOISSON"]
    init(){
        
        //创建User对象
        
        
    }
    func addTestData(){
    //        guard let entity = NSEntityDescription.entityForName("Plat", inManagedObjectContext: managedObjectContext) else {
    //            fatalError("It's a trap!! Could not find entity description.")
    //        }
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext

            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Plat")
            request.returnsObjectsAsFaults = false
                
                do{
                    let results = try context.fetch(request)
                    
                    if results.count == 0 {
                        print("No menu, need initialization!!!")
                            for i in 1...25{
                                let plat = NSEntityDescription.insertNewObject(forEntityName: "Plat",into: context) as! Plat
                                        
                                       //对象赋值
                                       plat.name = "\(self.categories[i%4]) #\(i/4+1)"
                                       plat.id = "\(self.categories[i%4]) #\(i/4+1)"
                                        plat.price = 10.5+Double(i)
                                plat.category = self.categories[i%4]
                                plat.id = String(i)
                            }
                        try context.save()
                    }
                    
                }catch{
                    print("Error: impossible to fetch the request")
                }
            

            
            
        }
}
