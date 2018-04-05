//
//  PickUpAddressCarAndBike.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class PickUpAddressCarAndBike: UIViewController{
    //MARK: - Properties
    
    @IBOutlet weak var pickUpAreaLbl: UILabel!
    @IBOutlet weak var addressTxtField: UITextField!
    
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
         setUpValue()
    }
    //MARK: - Custom Method
    
    func setUpValue(){
        AppUserDefaults.removeCarAndBikeItem()
        let areaValue = AppUserDefaults.value(forKey: .AreaOriginLocation, fallBackValue: "").string
        let addressValue = AppUserDefaults.value(forKey: .AddressPickUpLocation, fallBackValue: "").string
        if areaValue == "" {
            
        }else{
             pickUpAreaLbl.text = areaValue
        }
        if addressValue == ""{
            
        }else{
            addressTxtField.text = addressValue
        }
       
        
    }
    //MARK: - IBOutlet Method
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveClikedBtn(_ sender: Any) {
        if (pickUpAreaLbl.text == "Select Area" ) || (addressTxtField.text == nil) || (addressTxtField.text == "") {
            self.showToast(message: "Select Area and Address First")
        }
        else{
            AppUserDefaults.save(value: addressTxtField.text!, forKey: .AddressPickUpLocation)
            AppUserDefaults.save(value: pickUpAreaLbl.text!, forKey: .AreaOriginLocation)
            AppUserDefaults.save(value: AppConstants.YesStr, forKey: .IsPickUpSave)
            self.navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func selectAreaClickedBtn(_ sender: Any) {
        let originAreaVC = OriginAreaCar.instantiate(fromAppStoryboard: .CarAndBikeStoryboardMain)
        self.navigationController?.pushViewController(originAreaVC, animated: true)
    }
}
