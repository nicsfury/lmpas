//
//  homescreen.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 04/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class homescreen: UIViewController{
    
    @IBOutlet weak var tableview: UITableView!
    
    //MARK: - IBOutlet Method
    @IBAction func backCLickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension homescreen: UITableViewDelegate{
    
}


