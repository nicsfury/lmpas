//
//  AddressFieldOffice.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class AddressFieldOffice: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var expectedMoveDateLbl: UILabel!
    
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
     setUpLayout()
    }
    
    //MARK: - UIBOutlet Method
    @IBAction func backClcikedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
    @IBAction func nextClickedBtn(_ sender: Any) {
        
        let iSPickUp = AppUserDefaults.value(forKey: .IsPickUpSave, fallBackValue: "").string
        if  iSPickUp == AppConstants.YesStr{
            let SurveyDateVC = SurveyDateOffice.instantiate(fromAppStoryboard: .OfficeStoryboardMain)
            self.navigationController?.pushViewController(SurveyDateVC, animated: true)
            
            
        }else{
            self.showToast(message: "Fill PickUp Location First")
        }
       
    }
    
    
    @IBAction func addressClickedBtn(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 1:
            let pickUpLocationVC = PickUpAddressOffice.instantiate(fromAppStoryboard: .OfficeStoryboardMain)
            self.navigationController?.pushViewController(pickUpLocationVC, animated: true)
            break
        case 2:
            let destinationLocationVC = DestinationAddressOffice.instantiate(fromAppStoryboard: .OfficeStoryboardMain)
            self.navigationController?.pushViewController(destinationLocationVC, animated: true)
            break
        default:
            break
        }
    }
}
