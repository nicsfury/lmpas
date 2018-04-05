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
    
    //MARK: - Properties
    let faqArray = ["Office","International","Industrial","Domestic","Car/Bike","Others"]
   
    //MARK: - IBOutlet Method
    @IBAction func backClickedBtn(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    }
}
//MARK: - UITableViewDelegate Method
extension FaqMain: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let faqMainVC = FaqSubMain.instantiate(fromAppStoryboard: .FaqsMain)
        switch indexPath.row {
        case 0:
            faqMainVC.CatValue = AppConstants.METHOD_FAQ_OFFICE
        case 1:
            faqMainVC.CatValue = AppConstants.METHOD_FAQ_INTERNATION
        case 2:
            faqMainVC.CatValue = AppConstants.METHOD_FAQ_INDUSTRIAL
        case 3:
            faqMainVC.CatValue = AppConstants.METHOD_FAQ_DOMESTIC
        case 4:
            faqMainVC.CatValue = AppConstants.METHOD_FAQ_CAR_BIKE
        case 5:
            faqMainVC.CatValue = AppConstants.METHOD_FAQ_OTHER
        default:
            break
        }
        self.navigationController?.pushViewController(faqMainVC, animated: true)
    }
    
}
//MARK: - UITableViewDataSource Method
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
