//
//  HelpAndSupport.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 15/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit
import MessageUI


class HelpAndSupport: UIViewController{
    let arrayList = ["Call Us","Email Us","Raise a Request","Privacy Policy","Faq"]
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    
    @IBAction func backClcikedBtn(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    }
}

extension HelpAndSupport: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName )
        cell?.textLabel?.text = arrayList[indexPath.row]
        return cell!
    }
    
    
}

extension HelpAndSupport: UITableViewDelegate,MFMailComposeViewControllerDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            callUser()
            break
        case 1:
            emailUser()
            break
        case 2:
            
            break
        case 3:
            let privacy = PrivacyPolicy.instantiate(fromAppStoryboard: .HelpAndSupportMain)
            self.navigationController?.pushViewController(privacy, animated: true)
            break
        case 4:
            break
        default:
            break
            
        }
    }
    //MARK: - MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    //MARK: - Custom Method
    func emailUser(){
        
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([AppConstants.HelpAndSupportPhoneEmail])
                mail.setMessageBody("<p>Help And Support Apml</p>", isHTML: true)
                present(mail, animated: true)
            } else {
                // show failure alert
            }
        
        
        
    }
    
    
    func callUser(){
        if let url = URL(string: "tel://\(AppConstants.HelpAndSupportPhoneNumber)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        else {
            print("Your device doesn't support this feature.")
        }
    }
    
}
