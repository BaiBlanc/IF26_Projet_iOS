//
//  HistoriesViewController.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 02/01/2020.
//  Copyright © 2020 白哲源. All rights reserved.
//

import UIKit

class HistoriesViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
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
    

    

}
