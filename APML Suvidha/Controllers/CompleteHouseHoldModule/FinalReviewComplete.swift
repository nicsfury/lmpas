
//
//  FinalReviewComplete.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 28/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit
class FinalReviewComplete: UIViewController{
    
    //MARK: Properties
    
   
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    @IBOutlet weak var origibLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    
    //MARK: UIViewController Method
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        enquiryNumberLbl.text = AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!
        origibLbl.text = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string!
        destinationLbl.text = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").string!
    }
    
    //MARK: Custom Method
  
    //MARK: IBOutlet Method
    @IBAction func submitClickedBtn(_ sender: Any) {
    }
    @IBAction func backClcikedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: UITableViewDelegate Method
extension FinalReviewComplete: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 240
        }else{
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }else{
            let finalReviewVC = FinalReviewArticleList.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(finalReviewVC, animated: true)
        }
    }
}

//MARK: UITableViewDataSource Method
extension FinalReviewComplete: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.row == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "first") as! FinalReviewFirstCell
            cell1.setUpLayout()
            cell = cell1
        }else{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "second") as! FinalReviewSecondCell
            cell = cell1
        }
        return cell
    }
    
    
}
