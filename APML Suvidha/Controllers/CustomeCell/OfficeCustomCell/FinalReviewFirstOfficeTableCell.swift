//
//  FinalReviewFirstOfficeTableCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 02/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class FinalReviewFirstOfficeTableCell: UITableViewCell{
    
    @IBOutlet weak var destinationAddressLbl: UILabel!
    @IBOutlet weak var destinationAreaLbl: UILabel!
    @IBOutlet weak var pickUpAddressDetailsLbl: UILabel!
    @IBOutlet weak var pickUpAreaLbl: UILabel!
    @IBOutlet weak var moveDateLbl: UILabel!
    @IBOutlet weak var surveyDateLbl: UILabel!
    @IBOutlet weak var surveyTimeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setUpLayout(){
        moveDateLbl.text = AppUserDefaults.value(forKey: .ExpectedMoveDateComplete, fallBackValue: "").string!
        
        pickUpAreaLbl.text = AppUserDefaults.value(forKey: .AreaOriginLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressPickUpLocation, fallBackValue: "").string!
        
        var liftValue =  AppUserDefaults.value(forKey: .LiftAvialablePickUpLocation, fallBackValue: "1").string!
        
        if liftValue == "1" {
            liftValue = "Yes"
        }else{
            liftValue = "No"
        }
        
        pickUpAddressDetailsLbl.text = "Floor No. - " + AppUserDefaults.value(forKey: .FloorCountPickUpLocation, fallBackValue: "0").string! + ", Lift Available - " + liftValue + ", Pets - " + AppUserDefaults.value(forKey: .PetPickUpLocation, fallBackValue: "").string! + ", Plants - " + AppUserDefaults.value(forKey: .PlantPickUpLocation, fallBackValue: "").string!
        
        destinationAreaLbl.text = AppUserDefaults.value(forKey: .AreaDestinationLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressDestinationLocation, fallBackValue: "").string!
        liftValue =  AppUserDefaults.value(forKey: .LiftAvialableDestinationLocation, fallBackValue: "1").string!
        
        if liftValue == "1" {
            liftValue = "Yes"
        }else{
            liftValue = "No"
        }
        destinationAddressLbl.text = "Floor No. - " + AppUserDefaults.value(forKey: .FloorCountDestinationLocation, fallBackValue: "0").string!  + ", Lift Available - " + liftValue
        surveyDateLbl.text = AppUserDefaults.value(forKey: .ScheduleDate, fallBackValue: "").string!
        surveyTimeLbl.text = AppUserDefaults.value(forKey: .ScheduleTime, fallBackValue: "").string!
    }
}
