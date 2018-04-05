//
//  DestinationAddressCarAndBike.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class DestiantionAddressCarAndBike: UIViewController{
    
    //MARK: - Properties
    
    @IBOutlet weak var areaTxtField: UITextField!
    @IBOutlet weak var addressTxtField: UITextField!
    var isSelected: Bool = true
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setUpLayout()
    }
    func setUpLayout(){
        areaTxtField.text = AppUserDefaults.value(forKey: .AreaDestinationLocation, fallBackValue: "").string!
        addressTxtField.text = AppUserDefaults.value(forKey: .AddressDestinationLocation, fallBackValue: "").string!
    }
    //MARK: - IBOutlet Method
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func toBeContinueBtn(_ sender: Any) {
        if isSelected{
            areaTxtField.text = "TBD"
            addressTxtField.text = "TBD"
            isSelected = false
        }
        else{
            areaTxtField.text = ""
            addressTxtField.text = ""
            isSelected = true
        }
    }
    @IBAction func saveClikedBtn(_ sender: Any) {
        areaTxtField.text = "TBD"
        addressTxtField.text = "TBD"
        AppUserDefaults.save(value: addressTxtField.text!, forKey: .AddressDestinationLocation)
        AppUserDefaults.save(value: areaTxtField.text!, forKey: .AreaDestinationLocation)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func selectAreaClickedBtn(_ sender: Any) {
    }
}
