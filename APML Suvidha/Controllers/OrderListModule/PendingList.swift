//
//  PendingList.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 15/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class PendingList: UIViewController{
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    override func viewDidLoad() {
    }
}


extension PendingList: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pendingCell", for: indexPath) as! PendingListCustomCell
        return cell
    }
    
    
}


extension PendingList: UITableViewDelegate{
    
}
