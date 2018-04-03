//
//  FaqMain.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 16/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class FaqMain: UIViewController{
    
    let faqArray = ["Office","International","Industrial","Domestic","Car/Bike","Others"]
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    @IBAction func backClickedBtn(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    }
}

extension FaqMain: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let faqMainVC = FaqSubMain.instantiate(fromAppStoryboard: .FaqsMain)
        self.navigationController?.pushViewController(faqMainVC, animated: true)
    }
    
}

extension FaqMain: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName) as! FaqMainCutomCell
        cell.textLabel?.text = faqArray[indexPath.row]
        return cell
    }
    
    
}
