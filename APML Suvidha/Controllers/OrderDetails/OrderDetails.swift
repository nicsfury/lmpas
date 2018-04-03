//
//  OrderDetails.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 17/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class OrderDetails: UIViewController{
    let OrderDetailsArray = ["Move Details","Survey Details","Surveyor Details","Article Details","Billing Details","Upload Documents","Quotation Details","Have a Promocode?","Proceed To Payment","Cancel the Order","File a Complaint Claim"]
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension OrderDetails: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let moveDetails = MoveDetails.instantiate(fromAppStoryboard: .OrderDetailsMain)
            self.navigationController?.pushViewController(moveDetails, animated: true)
        case 1:
            let surveyDetails = ExternalSurveyDetails.instantiate(fromAppStoryboard: .OrderDetailsMain)
            self.navigationController?.pushViewController(surveyDetails, animated: true)
        case 2:
            let surveyorDetails = SurveyDetails.instantiate(fromAppStoryboard: .OrderDetailsMain)
            self.navigationController?.pushViewController(surveyorDetails, animated: true)
        case 3:
            break
        case 4:
            break
        case 5:
            break
        case 6:
            let quotationDetails = QuotationDetails.instantiate(fromAppStoryboard: .OrderDetailsMain)
            self.navigationController?.pushViewController(quotationDetails, animated: true)
        case 7:
            break
        case 8:
            let PaymentDetails = PaymentDetailsClass.instantiate(fromAppStoryboard: .PaymentDetailsMain)
            self.navigationController?.pushViewController(PaymentDetails, animated: true)
        case 9:
            break
        case 10:
            break
        default:
           break
        }
    }
}

extension OrderDetails: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderDetailsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName) as! OrderDetailsCustomCell
        cell.nameLbl.text = OrderDetailsArray[indexPath.row]
        return cell
    }
    
    
}

