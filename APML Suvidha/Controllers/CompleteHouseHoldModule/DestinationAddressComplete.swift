//
//  DestinationAddressComplete.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class DestinationAddressComplete: UIViewController{
    
    //MARK: - Properties
    @IBOutlet weak var liftSwitch: UISwitch!
    @IBOutlet weak var floorCountLbl: UILabel!
    @IBOutlet weak var destinationAddressTxtField: UITextField!
    @IBOutlet weak var destinationAreaTxtField: UITextField!
    @IBOutlet weak var toBeContinueImg: UIImageView!
    var isSelected: Bool = true
    var liftStr: String = AppConstants.OneStr
    //MARK: - UIVIewController Method
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        floorCountLbl.text = AppConstants.ZeroStr
    }
    //MARK: - IBOutlet Method
    @IBAction func liftSwitchCLickedBtn(_ sender: Any) {
        if liftSwitch.isOn{
            liftStr = AppConstants.OneStr
        }else{
             liftStr = AppConstants.ZeroStr
        }
    }
    @IBAction func plusClickedBtn(_ sender: Any) {
        let floorCount = (floorCountLbl.text?.stringToInt())! + 1
        floorCountLbl.text = floorCount.intToString()
    }
    
    @IBAction func minusClickedBtn(_ sender: Any) {
        if floorCountLbl.text?.stringToInt() == AppConstants.ZeroStr.stringToInt(){
        }else{
            let floorCount = (floorCountLbl.text?.stringToInt())! - 1
            floorCountLbl.text = floorCount.intToString()
        }
    }
    @IBAction func toBeContinueBtn(_ sender: Any) {
        if isSelected{
            destinationAreaTxtField.text = "TBD"
            destinationAddressTxtField.text = "TBD"
            isSelected = false
        }
        else{
            destinationAreaTxtField.text = ""
            destinationAddressTxtField.text = ""
            isSelected = true
        }
    }
    @IBAction func saveClickedBtn(_ sender: Any) {
        destinationAreaTxtField.text = "TBD"
        destinationAddressTxtField.text = "TBD"
        AppUserDefaults.save(value: destinationAddressTxtField.text!, forKey: .AddressDestinationLocation)
        AppUserDefaults.save(value: floorCountLbl.text!, forKey: .FloorCountDestinationLocation)
        AppUserDefaults.save(value: destinationAreaTxtField.text!, forKey: .AreaDestinationLocation)
        AppUserDefaults.save(value: liftStr, forKey: .LiftAvialableDestinationLocation)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
