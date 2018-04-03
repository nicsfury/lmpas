//
//  SurveyDateComplete.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class SurveyDateComplete: UIViewController{
    
    //MARK: - Properties
    @IBOutlet weak var scheduleDateLbl: UILabel!
    @IBOutlet weak var destinationAddressDetialsLbl: UILabel!
    @IBOutlet weak var dstinationAreaAddressLbl: UILabel!
    @IBOutlet weak var pickUpAddressDetailsLbl: UILabel!
    @IBOutlet weak var pickUpAreaAddressLbl: UILabel!
    @IBOutlet weak var expectedMoveDateStr: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setUpLayout()
    }
    
    //MARK: - Custom Method
    func setUpLayout(){
        enquiryNumberLbl.text = AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!
        originLbl.text = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string!
        destinationLbl.text = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").string!
        expectedMoveDateStr.text = AppUserDefaults.value(forKey: .ExpectedMoveDateComplete, fallBackValue: "").string!
        pickUpAreaAddressLbl.text = AppUserDefaults.value(forKey: .AreaOriginLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressPickUpLocation, fallBackValue: "").string!
        
       var liftValue =  AppUserDefaults.value(forKey: .LiftAvialablePickUpLocation, fallBackValue: "1").string!
        
        if liftValue == "1" {
            liftValue = "Yes"
        }else{
            liftValue = "No"
        }
        
        pickUpAddressDetailsLbl.text = "Floor No. - " + AppUserDefaults.value(forKey: .FloorCountPickUpLocation, fallBackValue: "0").string! + ", Lift Available - " + liftValue + ", Pets - " + AppUserDefaults.value(forKey: .PetPickUpLocation, fallBackValue: "").string! + ", Plants - " + AppUserDefaults.value(forKey: .PlantPickUpLocation, fallBackValue: "").string!
        
        dstinationAreaAddressLbl.text = AppUserDefaults.value(forKey: .AreaDestinationLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressDestinationLocation, fallBackValue: "").string!
         liftValue =  AppUserDefaults.value(forKey: .LiftAvialableDestinationLocation, fallBackValue: "1").string!
        
        if liftValue == "1" {
            liftValue = "Yes"
        }else{
            liftValue = "No"
        }
        destinationAddressDetialsLbl.text = "Floor No. - " + AppUserDefaults.value(forKey: .FloorCountDestinationLocation, fallBackValue: "0").string!  + ", Lift Available - " + liftValue
        
        
        
    }
    
    
    //MARK: - IBOutlet Method
    @IBAction func nextClickedBtn(_ sender: Any) {
        if scheduleDateLbl.text == "" {
            self.showToast(message: AppConstants.SDF)
        }else{
            AppUserDefaults.save(value: scheduleDateLbl.text!, forKey: .ScheduleDate)
            WebServices.shared.getTimeStot(methodName: AppConstants.METHOD_GET_SLOT, surveydate:  scheduleDateLbl.text!, city: originLbl.text! , firstmove: "1",  completion: {(response,error) in
                if error == nil{
                    let status = response![AppConstants.STATUSTXT] as! Int
                    switch(status){
                    case 200:
                        let timeArray = response!["timeslot"] as! [String]
                       
                        let AddressCompleteVC = SurveyTimeComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
                        AddressCompleteVC.timeArrayList = timeArray
                        self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
                    default:
                        break
                    }
                }
            })
            
//            let finalSubmitVC = SubmitStepComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
//            self.navigationController?.pushViewController(finalSubmitVC, animated: true)
        }
       
    }
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func surveyDateandTimeClickedBtn(_ sender: Any) {
        // Create a DatePicker
        let datePicker: UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.frame = CGRect(x: 0, y: self.view.frame.height-200, width: self.view.frame.width, height: 200)
        datePicker.setExpectedMoveDate()
        datePicker.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(MoveDateComplete.datePickerValueChanged(_:)), for: .valueChanged)
        self.view.addSubview(datePicker)
    }
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        scheduleDateLbl.text = selectedDate
        
    }
}
