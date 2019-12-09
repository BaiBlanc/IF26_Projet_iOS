//
//  PopUpViewViewController.swift
//  IF26_Projet_iOS
//
//  Created by 白哲源 on 08/12/2019.
//  Copyright © 2019 白哲源. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBAction func CloseOnClick(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        // Do any additional setup after loading the view.
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
