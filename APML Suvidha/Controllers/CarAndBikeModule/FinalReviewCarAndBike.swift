//
//  FinalReviewCarAndBike.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class FinalReviewCarAndBike: UIViewController{
    //MARK: - Properties
    
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    
    @IBOutlet weak var destinationLbl: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var originLbl: UILabel!
    //MARK: - UIViewController Method
    
    override func viewDidAppear(_ animated: Bool) {
        enquiryNumberLbl.text = AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!
        destinationLbl.text = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").string!
        originLbl.text = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string!
    }
    //MARK: - IBOutlet Method
    
    @IBAction func submitClickedBtn(_ sender: Any) {
    }
    @IBAction func backCLickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Custom Method
}


extension FinalReviewCarAndBike: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 185
        }else{
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }else{
            let finalReviewVC = FinalArticleReviewPage.instantiate(fromAppStoryboard: .CarAndBikeStoryboardMain)
            self.navigationController?.pushViewController(finalReviewVC, animated: true)
        }
    }
}


extension FinalReviewCarAndBike: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.row == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "first") as! FinalReviewCarAndBikeTableViewCell
            cell1.setUpLayout()
            cell = cell1
        }else{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "second") as! FinalReviewSecondCarandBikeTableCell
            cell = cell1
        }
        return cell
    }
    
    
}
