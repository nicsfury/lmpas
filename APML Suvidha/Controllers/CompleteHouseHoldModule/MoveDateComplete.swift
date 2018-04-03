//
//  MoveDateComplete.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class MoveDateComplete: UIViewController{
    //MARK: - Properties
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var datePickerBtn: UIButton!
    @IBOutlet weak var enquiryNoLbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
        let EnquiryName = AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string
        let OriginName = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string
         let DestinationName = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").string
        enquiryNoLbl.text = EnquiryName
        originLbl.text = OriginName
        destinationLbl.text = DestinationName
        self.navigationController?.setNavigationBarHidden(true,animated:true)
    }
    
    //MARK: - IBOutlet Method
    @IBAction func nextClcikedBtn(_ sender: Any) {
        if dateLbl.text == ""{
            self.showToast(message: AppConstants.SDF)
        } else{
            let pickUpDate = dateLbl.text
        AppUserDefaults.save(value: pickUpDate!, forKey: .ExpectedMoveDateComplete)
            WebServices.shared.setExpectedMoveDate(methodName: AppConstants.METHOD_CURRENT_EXPECTED_MOVEDATE, uniqid: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, step: "2", expectedmovedate: pickUpDate!, completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                switch(status){
                case 200:
                    let areaStatus = response!["areastatus"] as! String
                    AppUserDefaults.save(value: areaStatus, forKey: .AreaStatus)
                    let AddressCompleteVC = AddressFieldComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
                    self.navigationController?.pushViewController(AddressCompleteVC, animated: true)
                default:
                    break
                }
            }
        })
        }
        
    }
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func chooseMoveDateClickedBtn(_ sender: Any) {
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
        dateLbl.text = selectedDate
        
    }
}
