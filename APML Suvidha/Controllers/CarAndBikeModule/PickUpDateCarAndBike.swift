//
//  PickUpDateCarAndBike.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class PickUpDateCarAndBike: UIViewController{
    
    //MARK: - Properties
     let buttonViewDate : UIView = UIView()
    let datePickerDate: UIDatePicker = UIDatePicker()
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    @IBOutlet weak var pickUpAddressLbl: UILabel!
    @IBOutlet weak var destinationAddressLbl: UILabel!
    
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
    pickUpAddressLbl.text = AppUserDefaults.value(forKey: .AreaOriginLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressPickUpLocation, fallBackValue: "").string!
    destinationAddressLbl.text = AppUserDefaults.value(forKey: .AreaDestinationLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressDestinationLocation, fallBackValue: "").string!
    }
    
    
    //MARK: - IBOutlet Method
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectpickupdateClikedBtn(_ sender: Any) {
       
    }
   
    @IBAction func pickupDateClickedBtn(_ sender: Any) {
        datePickerDate.datePickerMode = UIDatePickerMode.date
        datePickerDate.frame = CGRect(x: 0, y: self.view.frame.height-200, width: self.view.frame.width, height: 200)
        datePickerDate.backgroundColor = UIColor.white
        datePickerDate.setExpectedMoveDate()
        datePickerDate.addTarget(self, action: #selector(Profile.datePickerValueChanged(_:)), for: .valueChanged)
        let screenSize: CGRect = UIScreen.main.bounds
        buttonViewDate.frame = CGRect(x: 0, y: self.view.frame.height-250, width: screenSize.width , height: 50)
        buttonViewDate.backgroundColor = UIColor.white
        //custom button
        let button = UIButton()
        button.frame = CGRect(x: buttonViewDate.frame.size.width - 60, y: 0, width: 50, height: 50)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonActionDate), for: .touchUpInside)
        buttonViewDate.addSubview(button)
        self.view.addSubview(buttonViewDate)
        self.view.addSubview(datePickerDate)
        datePickerDate.isHidden = false
        buttonViewDate.isHidden = false
    }
   
    @objc func buttonActionDate(sender: UIButton!) {
        datePickerDate.isHidden = true
        buttonViewDate.isHidden = true
        let SubmitStepVC = SubmitStepCarAndBike.instantiate(fromAppStoryboard: .CarAndBikeStoryboardMain)
        SubmitStepVC.dateStr = dateLbl.text!
        self.navigationController?.pushViewController(SubmitStepVC, animated: true)
    }
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        dateLbl.text = selectedDate
        AppUserDefaults.save(value: selectedDate, forKey: .ExpectedMoveDateComplete)
    }
}
