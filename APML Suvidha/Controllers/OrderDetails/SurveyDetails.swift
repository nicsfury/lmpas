//
//  SurveyDetails.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 17/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class SurveyDetails: UIViewController{
    let SurveyArray = ["Surveyor Details","Packing Supervisor","Delivery Supervisor"]
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SurveyDetails: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SurveyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName) as! SurveyDetailsCustomCell
        cell.textLabel?.text = SurveyArray[indexPath.row]
        return cell
    }
    
    
}

extension SurveyDetails: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let surveyDetailsSub = SurveyDetailsSub.instantiate(fromAppStoryboard: .OrderDetailsMain)
            self.navigationController?.pushViewController(surveyDetailsSub, animated: true)
            break
        default:
            break
        }
    }
}
