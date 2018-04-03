//
//  PickUpAddressFewItem.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit
class PickUpAddressFewItem: UIViewController{
    //MARK: - Properties
    @IBOutlet weak var areaNameLbl: UILabel!
    @IBOutlet weak var addressTxtField: UITextField!
    @IBOutlet weak var floorCountLbl: UILabel!
    @IBOutlet weak var liftAvaliableSwitch: UISwitch!

    var LiftAvailableStr: String = AppConstants.OneStr
    
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        floorCountLbl.text = AppConstants.ZeroStr
        setUpValue()
    }
    //MARK: - Custom Method
    
    func setUpValue(){
        let areaValue = AppUserDefaults.value(forKey: .AreaOriginLocation, fallBackValue: "").string
        let addressValue = AppUserDefaults.value(forKey: .AddressPickUpLocation, fallBackValue: "").string
        let floorCountValue = AppUserDefaults.value(forKey: .FloorCountPickUpLocation, fallBackValue: "0").string
        
       
        let LiftAvialableValue = AppUserDefaults.value(forKey: .LiftAvialablePickUpLocation, fallBackValue: "").string
        
        areaNameLbl.text = areaValue
        addressTxtField.text = addressValue
        floorCountLbl.text = floorCountValue
        
        if LiftAvialableValue == ""{
            
        }else{
            if LiftAvialableValue == AppConstants.OneStr{
                liftAvaliableSwitch.setOn(true, animated: true)
            }else{
                liftAvaliableSwitch.setOn(false, animated: true)
            }
        }
        
        
        
        
       
        if areaValue == "" {
            areaNameLbl.text = "Select Area"
        }
        
    }
    //MARK: - IBOutlet Method
    @IBAction func saveClickedBtn(_ sender: Any) {
        
        if (areaNameLbl.text == "Select Area" ) || (addressTxtField.text == nil) || (addressTxtField.text == "") {
            self.showToast(message: "Select Area and Address First")
        }
        else{
            AppUserDefaults.save(value: addressTxtField.text!, forKey: .AddressPickUpLocation)
            AppUserDefaults.save(value: floorCountLbl.text!, forKey: .FloorCountPickUpLocation)
            AppUserDefaults.save(value: areaNameLbl.text!, forKey: .AreaOriginLocation)
           
            AppUserDefaults.save(value: LiftAvailableStr, forKey: .LiftAvialablePickUpLocation)
            AppUserDefaults.save(value: AppConstants.YesStr, forKey: .IsPickUpSave)
            self.navigationController?.popViewController(animated: true)
        }
    }
   
    @IBAction func liftAvailableClickedBtn(_ sender: Any) {
        if liftAvaliableSwitch.isOn{
            LiftAvailableStr = AppConstants.OneStr
        }else{
            LiftAvailableStr = AppConstants.ZeroStr
        }
    }
    @IBAction func minusClickedBtn(_ sender: Any) {
        if floorCountLbl.text?.stringToInt() == AppConstants.ZeroStr.stringToInt(){
            
        }else{
            let FloorCount = (floorCountLbl.text?.stringToInt())! - 1
            floorCountLbl.text = FloorCount.intToString()
        }
    }
    @IBAction func plusClickedBtn(_ sender: Any) {
        let FloorCount = (floorCountLbl.text?.stringToInt())! + 1
        floorCountLbl.text = FloorCount.intToString()
    }
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectAreaClickedBtn(_ sender: Any) {
        let originAreaVC = OriginAreaComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
        self.navigationController?.pushViewController(originAreaVC, animated: true)
    }
    
}
