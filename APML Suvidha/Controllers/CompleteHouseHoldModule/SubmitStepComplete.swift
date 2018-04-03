//
//  SubmitStepComplete.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class SubmitStepComplete: UIViewController{
    
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var expectedMoveDateLbl: UILabel!
    @IBOutlet weak var pickAreaLbl: UILabel!
    @IBOutlet weak var pickDetailsLbl: UILabel!
    @IBOutlet weak var destinationAreaLbl: UILabel!
    @IBOutlet weak var destinationDetailsLbl: UILabel!
    @IBOutlet weak var surveyDateLbl: UILabel!
    @IBOutlet weak var surveyTimeLbl: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setUpLayout()
    }
    //MARK: - Custom Method
    //MARK: - Custom API Call
                func getCityLocation(name: String){
    
                    WebServices.shared.setCompleteAddressStep2(methodName: AppConstants.METHOD_STEP2, originArea: AppUserDefaults.value(forKey: .AreaOriginLocation, fallBackValue: "").string!, originAddress: AppUserDefaults.value(forKey: .AddressPickUpLocation, fallBackValue: "").string!, petValue: AppUserDefaults.value(forKey: .PetPickUpLocation, fallBackValue: "").string!, plantValue: AppUserDefaults.value(forKey: .PlantPickUpLocation, fallBackValue: "").string!, email: AppUserDefaults.value(forKey: .USEREMAIL, fallBackValue: "").string!, originFloor: AppUserDefaults.value(forKey: .FloorCountPickUpLocation, fallBackValue: "").string!, originLift: AppUserDefaults.value(forKey: .LiftAvialablePickUpLocation, fallBackValue: "").string!, destinationArea: AppUserDefaults.value(forKey: .AreaDestinationLocation, fallBackValue: "").string!, destinationAddress: AppUserDefaults.value(forKey: .AddressDestinationLocation, fallBackValue: "").string!, destinationFloor: AppUserDefaults.value(forKey: .FloorCountDestinationLocation, fallBackValue: "").string!, destinationLift: AppUserDefaults.value(forKey: .LiftAvialableDestinationLocation, fallBackValue: "").string!, surveyDate: AppUserDefaults.value(forKey: .ScheduleDate, fallBackValue: "").string!, selfSurvey: AppUserDefaults.value(forKey: .AreaOriginLocation, fallBackValue: "").string!, expectedMoveDate: AppUserDefaults.value(forKey: .ExpectedMoveDateComplete, fallBackValue: "").string!, surveyTimeSlot: AppUserDefaults.value(forKey: .ScheduleTime, fallBackValue: "").string!, uniqueId: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, name: AppUserDefaults.value(forKey: .USERNAME, fallBackValue: "").string!, completion: {(response,error) in
                        if error == nil{
                            let status = response![AppConstants.STATUSTXT] as! Int
                            let statusString = "\(status)"
                            switch(statusString){
                            case AppConstants.SUCCESS:
                                let ArticleComplete = ArticleListComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
                                self.navigationController?.pushViewController(ArticleComplete, animated: true)
                                break
    
                            case AppConstants.FAILED:
                                self.showToast(message: AppConstants.DNP)
    
                            default:
                                break
                            }
                        }
                    })
                }
    func setUpLayout(){
        enquiryNumberLbl.text = AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!
        originLbl.text = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string!
        destinationLbl.text = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").string!
        expectedMoveDateLbl.text = AppUserDefaults.value(forKey: .ExpectedMoveDateComplete, fallBackValue: "").string!
        pickAreaLbl.text = AppUserDefaults.value(forKey: .AreaOriginLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressPickUpLocation, fallBackValue: "").string!
        
        var liftValue =  AppUserDefaults.value(forKey: .LiftAvialablePickUpLocation, fallBackValue: "1").string!
        
        if liftValue == "1" {
            liftValue = "Yes"
        }else{
            liftValue = "No"
        }
        
        pickDetailsLbl.text = "Floor No. - " + AppUserDefaults.value(forKey: .FloorCountPickUpLocation, fallBackValue: "0").string! + ", Lift Available - " + liftValue + ", Pets - " + AppUserDefaults.value(forKey: .PetPickUpLocation, fallBackValue: "").string! + ", Plants - " + AppUserDefaults.value(forKey: .PlantPickUpLocation, fallBackValue: "").string!
        
        destinationAreaLbl.text = AppUserDefaults.value(forKey: .AreaDestinationLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressDestinationLocation, fallBackValue: "").string!
        liftValue =  AppUserDefaults.value(forKey: .LiftAvialableDestinationLocation, fallBackValue: "1").string!
        
        if liftValue == "1" {
            liftValue = "Yes"
        }else{
            liftValue = "No"
        }
        destinationDetailsLbl.text = "Floor No. - " + AppUserDefaults.value(forKey: .FloorCountDestinationLocation, fallBackValue: "0").string!  + ", Lift Available - " + liftValue
        surveyDateLbl.text = AppUserDefaults.value(forKey: .ScheduleDate, fallBackValue: "").string!
        surveyTimeLbl.text = AppUserDefaults.value(forKey: .ScheduleTime, fallBackValue: "").string!
        
    }
    //Mark - IBOutlet Method
    @IBAction func submitClickedBtn(_ sender: Any) {
        getCityLocation(name: AppConstants.METHOD_STEP2)
        
    }
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}
