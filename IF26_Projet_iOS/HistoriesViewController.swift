//
//  HistoriesViewController.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 02/01/2020.
//  Copyright © 2020 白哲源. All rights reserved.
//

import UIKit

class HistoriesViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var username = "Lemercier"
    var commande:Commande? = nil
    @IBOutlet weak var tableview: UITableView!
    var commandArray = [(time:String,detail:String)]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableView reload")
        self.updateHistories()
        return commandArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "historyCell"
        let cell = tableview.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! HistoryTableViewCell
        cell.timeLabel.text = commandArray[indexPath.row].time
        cell.commandLabel.text = commandArray[indexPath.row].detail
        cell.tableview = self.tableview
        return cell
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.tableview.reloadData()
    }
    func updateHistories(){
        print( self.commandArray.count," --> ")
        self.commandArray = self.commande!.fetchCommand()
        print(self.commandArray.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
        tableview.delegate = self
        self.commande = Commande()
        self.updateHistories()
    }
    

    @IBAction func exportOnClick(_ sender: UIButton) {
        let fileName = "\(username).csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvText = "command detail,timestamp\n"
        let count = self.commandArray.count
        if count > 0 {
            for command in commandArray{
                csvText.append("\(command.detail),\(command.time)\n")
            }
            
            do {
            try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
                                
                let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
                vc.excludedActivityTypes = [
                    UIActivity.ActivityType.assignToContact,
                    UIActivity.ActivityType.saveToCameraRoll,
                    UIActivity.ActivityType.postToFlickr,
                    UIActivity.ActivityType.postToVimeo,
                    UIActivity.ActivityType.postToTwitter,
                    UIActivity.ActivityType.postToFacebook,
                    UIActivity.ActivityType.openInIBooks
                ]
            present(vc, animated: true, completion: nil)

            } catch {
                
                print("Failed to create file")
                print("\(error)")
            }
        }else{
            print("Error", "There is no data to export")
        }
        
            
        
    }
    

}
