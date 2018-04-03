//
//  SurveyTimeOffice.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 02/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class SurveyTimeOffice: UIViewController{
    
    //MARK: - Properties
    @IBOutlet weak var dateLbl: UILabel!
    var timeArrayList: [String]!
    var morningArray: [String]!
    var afterNoonArray: [String]!
    var eveningArray: [String]!
    @IBOutlet var timeBtn: [UIButton]!
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
        morningArray = morningTime(str: timeArrayList)
        afterNoonArray = afterNoonTime(str: timeArrayList)
        eveningArray = eveningTime(str: timeArrayList)
        setUpLayout()
    }
    
    //MARK: - IBOutlet Method
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func timeClcikedBtn(_ sender: Any) {
        let tagValue: Int = (sender as AnyObject).tag
        switch tagValue {
        case 0:
            AppUserDefaults.save(value: morningArray[0], forKey: .ScheduleTime)
            let AddressCompleteVC = SubmitStepOffice.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
        case 4:
            AppUserDefaults.save(value: morningArray[1], forKey: .ScheduleTime)
            let AddressCompleteVC = SubmitStepOffice.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
        case 7:
            AppUserDefaults.save(value: morningArray[2], forKey: .ScheduleTime)
            let AddressCompleteVC = SubmitStepOffice.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
        case 1:
            AppUserDefaults.save(value: afterNoonArray[0], forKey: .ScheduleTime)
            let AddressCompleteVC = SubmitStepOffice.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
        case 5:
            AppUserDefaults.save(value: afterNoonArray[1], forKey: .ScheduleTime)
            let AddressCompleteVC = SubmitStepOffice.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
        case 8:
            AppUserDefaults.save(value: afterNoonArray[2], forKey: .ScheduleTime)
            let AddressCompleteVC = SubmitStepOffice.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
        case 6:
            AppUserDefaults.save(value: eveningArray[0], forKey: .ScheduleTime)
            let AddressCompleteVC = SubmitStepOffice.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
        case 2:
            AppUserDefaults.save(value: eveningArray[1], forKey: .ScheduleTime)
            let AddressCompleteVC = SubmitStepOffice.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
        case 3:
            AppUserDefaults.save(value: eveningArray[2], forKey: .ScheduleTime)
            let AddressCompleteVC = SubmitStepOffice.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
        default:
            break
        }
    }
    //MARK: - Custom Method
    func setUpLayout(){
        dateLbl.text = AppUserDefaults.value(forKey: .ScheduleDate, fallBackValue: "").string!
        //Morning Label
        switch morningArray.count {
        case 1:
            timeBtn[0].setTitle(morningArray[0], for: UIControlState.normal)
        case 2:
            timeBtn[0].setTitle(morningArray[0], for: UIControlState.normal)
            timeBtn[4].setTitle(morningArray[1], for: UIControlState.normal)
        case 3:
            timeBtn[0].setTitle(morningArray[0], for: UIControlState.normal)
            timeBtn[4].setTitle(morningArray[1], for: UIControlState.normal)
            timeBtn[7].setTitle(morningArray[2], for: UIControlState.normal)
        default:
            break
        }
        //EveningArray Label
        switch afterNoonArray.count {
        case 1:
            timeBtn[1].setTitle(afterNoonArray[0], for: UIControlState.normal)
        case 2:
            timeBtn[1].setTitle(afterNoonArray[0], for: UIControlState.normal)
            timeBtn[5].setTitle(afterNoonArray[1], for: UIControlState.normal)
        case 3:
            timeBtn[1].setTitle(afterNoonArray[0], for: UIControlState.normal)
            timeBtn[5].setTitle(afterNoonArray[1], for: UIControlState.normal)
            timeBtn[8].setTitle(afterNoonArray[2], for: UIControlState.normal)
        default:
            break
        }
        
        //AfterNoonArray Label
        switch eveningArray.count {
        case 1:
            timeBtn[6].setTitle(eveningArray[0], for: UIControlState.normal)
        case 2:
            timeBtn[6].setTitle(eveningArray[0], for: UIControlState.normal)
            timeBtn[2].setTitle(eveningArray[1], for: UIControlState.normal)
        case 3:
            timeBtn[6].setTitle(eveningArray[0], for: UIControlState.normal)
            timeBtn[2].setTitle(eveningArray[1], for: UIControlState.normal)
            timeBtn[3].setTitle(eveningArray[2], for: UIControlState.normal)
        default:
            break
        }
    }
    func morningTime(str:[String]) -> [String]{
        var temp1 = [String]()
        for temp in str {
            
            var strArr = temp.split{$0 == ":"}.map(String.init)
            let hour = Int(strArr[0])!
            _ = Int(strArr[1])!
            if(hour < 12){
                temp1.append(temp)
            }
        }
        return temp1
    }
    func afterNoonTime(str:[String]) -> [String]{
        var temp1 = [String]()
        for temp in str {
            
            var strArr = temp.split{$0 == ":"}.map(String.init)
            let hour = Int(strArr[0])!
            _ = Int(strArr[1])!
            if(hour >= 12 && hour < 16){
                temp1.append(temp)
            }
        }
        return temp1
    }
    func eveningTime(str:[String]) -> [String]{
        var temp1 = [String]()
        for temp in str {
            
            var strArr = temp.split{$0 == ":"}.map(String.init)
            let hour = Int(strArr[0])!
            _ = Int(strArr[1])!
            if( hour >= 16){
                temp1.append(temp)
            }
        }
        return temp1
    }
    
    
}

