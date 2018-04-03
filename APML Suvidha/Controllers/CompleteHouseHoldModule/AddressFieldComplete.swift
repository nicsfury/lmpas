//
//  AddressFieldComplete.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class AddressFieldComplete: UIViewController{
    
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var expectedMoveDateLbl: UILabel!
    
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setUpLayout()
    }
    //MARK: - Custom Method
    
    func setUpLayout(){
        let EnquiryName = AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string
        let OriginName = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string
        let DestinationName = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").string
        let ExpectedMoveDateName = AppUserDefaults.value(forKey: .ExpectedMoveDateComplete, fallBackValue: "").string
        enquiryNumberLbl.text = EnquiryName
        originLbl.text = OriginName
        destinationLbl.text = DestinationName
        expectedMoveDateLbl.text = ExpectedMoveDateName
        
    }
    //MARK: - IBOutlet Method
    @IBAction func backClickedBtn(_ sender: Any){
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextClickedBtn(_ sender: Any) {
        let iSPickUp = AppUserDefaults.value(forKey: .IsPickUpSave, fallBackValue: "").string
        if  iSPickUp == AppConstants.YesStr{
            let SurveyDateCompleteVC = SurveyDateComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(SurveyDateCompleteVC, animated: true)

           
        }else{
            self.showToast(message: "Fill PickUp Location First")
        }
       
    }
    
    @IBAction func selectLocationClickedBtn(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 1:
            let PickUpLocationVC = PickUpLocationComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(PickUpLocationVC, animated: true)
            break
        case 2:
            let DestinationAddressVC = DestinationAddressComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
            self.navigationController?.pushViewController(DestinationAddressVC, animated: true)
            break
        default:
            break
        }
    }
    
}
