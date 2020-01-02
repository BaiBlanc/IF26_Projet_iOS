//
//  HistoriesViewController.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 02/01/2020.
//  Copyright © 2020 白哲源. All rights reserved.
//

import UIKit

class HistoriesViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    var commandArray = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commandArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "historyCell"
        let cell = tableview.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! HistoryTableViewCell
        cell.commandLabel.text = commandArray[indexPath.row]
        return cell
    }
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
        tableview.delegate = self
        let commande = Commande()
        commandArray = commande.fetchCommand()
    }
    

    

}
