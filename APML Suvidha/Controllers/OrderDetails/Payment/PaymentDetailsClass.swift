//
//  PaymentDetails.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 19/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class PaymentDetailsClass: UIViewController{
    let PaymentArray = ["Credit/Debit Card","Net Banking","EMI"]
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PaymentDetailsClass: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let CreditVC = CreditDebitCard.instantiate(fromAppStoryboard: .PaymentDetailsMain)
            self.navigationController?.pushViewController(CreditVC, animated: true)
        case 1:
            let NetBankingVC = NetBanking.instantiate(fromAppStoryboard: .PaymentDetailsMain)
            self.navigationController?.pushViewController(NetBankingVC, animated: true)
        case 2:
            let EMIVC = EMI.instantiate(fromAppStoryboard: .PaymentDetailsMain)
            self.navigationController?.pushViewController(EMIVC, animated: true)
        default:
            break
        }
    }
}

extension PaymentDetailsClass: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PaymentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName)!
        cell.textLabel?.text = PaymentArray[indexPath.row]
        return cell
    }
    
    
    
}
