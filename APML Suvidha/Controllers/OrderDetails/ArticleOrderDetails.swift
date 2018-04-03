//
//  ArticleOrderDetails.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 17/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit


class ArticleOrderDetails: UIViewController{
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
}

extension ArticleOrderDetails: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName) as! ArticleOrderDetailsCustomCell
        return cell
    }
    
    
}

extension ArticleOrderDetails: UITableViewDelegate{
    
}
