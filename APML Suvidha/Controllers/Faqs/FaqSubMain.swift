//
//  FaqSubMain.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 16/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class FaqSubMain: UIViewController{
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    @IBAction func backClickedBtn(_ sender: Any) {
   self.navigationController?.popViewController(animated: true)
    }
}

extension FaqSubMain: UITableViewDelegate{
    
}
extension FaqSubMain: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName) as! FaqSubMainCustomCell
        cell.textLabel?.text = "Demo Text"
        return cell
    }
    
    
}
