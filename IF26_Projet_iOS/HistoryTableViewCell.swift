//
//  HistoryTableViewCell.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 02/01/2020.
//  Copyright © 2020 白哲源. All rights reserved.
//

import UIKit
import CoreData

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var commandLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var tableview:UITableView? = nil
    var superController: HistoriesViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deleteOnClick(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert",
                        message: "Are you sure you want to delete this history？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Delete", style: .default, handler: {
            action in
            self.delete(sender)
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.superController!.present(alertController, animated: true, completion: nil)
        
        
        
//        tableview!.reloadData()
        
        
    }
    
    func delete(_ sender: UIButton){
        let timestamp:String = self.timeLabel.text!
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
               
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Command")
        let predicate = NSPredicate(format: "timestamp== %@ ", timestamp)
        request.predicate = predicate
        do{
            let commandes = try context.fetch(request)
            
            for command in commandes as! [Command]{
                context.delete(command)
            }
            try context.save()
        }catch{
            print("Error: impossible to fetch the request")
        }
        let indexPath = tableview?.indexPath(for: sender.superview?.superview as! UITableViewCell)
        tableview?.deleteRows(at: [indexPath!], with: .left)
    }
    
    func sendSuperController(_ superController:HistoriesViewController){
        self.superController = superController
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
