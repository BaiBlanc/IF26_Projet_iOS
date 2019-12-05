//
//  MenuViewController.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 26/11/2019.
//  Copyright © 2019 白哲源. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var count:Int?
        if tableView == self.Left_TableView {
            count = 1
        }
        
        if tableView == self.Right_TableView {
            count =  sections.count
        }
        return count!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        
        if tableView == self.Left_TableView {
            count = sections.count
        }
        
        if tableView == self.Right_TableView {
            count =  plats.count
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        if tableView == self.Left_TableView {
            cell = Left_TableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath)
            let previewDetail = sections[indexPath.row]
            cell!.textLabel!.text = String(previewDetail)
            
        }
        
        if tableView == self.Right_TableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "platCell", for: indexPath)
            let previewDetail = plats[indexPath.row]
            cell!.textLabel!.text = String(previewDetail)+"Section\(indexPath.section)"
            
        }
        
        
        
        return cell!
        
    }
    
    func tableView (_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if(tableView == Right_TableView){
            return "Section \(section)"
        }
        return nil
    }
    
    var plats:[Int] = [1,2,3,4,5]
    var sections:[Int] = [1,2,3,4,5,6]
    @IBOutlet weak var Right_TableView: UITableView!
    @IBOutlet weak var Left_TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        Left_TableView.dataSource = self
        Left_TableView.delegate = self
        Left_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "sectionCell")
        
        Right_TableView.dataSource = self
        Right_TableView.delegate = self
        Right_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "platCell")
        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
