//
//  Individual.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 04/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class Individual: UIViewController{
    //MARK: - Properties
    
    @IBOutlet weak var gstnoTxtField: UITextField!
    @IBOutlet weak var countryTxtField: UITextField!
    @IBOutlet weak var stateTxtField: UITextField!
    @IBOutlet weak var zipCodeTxtField: UITextField!
    @IBOutlet weak var cityTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var alternateTxtField: UITextField!
    @IBOutlet weak var mobileTxtField: UITextField!
    @IBOutlet weak var addressTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var firstNameTxtField: UITextField!
     var billModels = [BillingModel]()
    
    //MARK: - UIViewController Method
    override func viewDidAppear(_ animated: Bool) {
        getBillDetails()
    }
    //MARK: - Custom Method
    func setUpLayout(){
        let model: BillingModel
        model = billModels[0]
        self.firstNameTxtField.text = model.FirstName
        self.lastNameTxtField.text = model.LastName
        self.emailTxtField.text = model.Email
        self.mobileTxtField.text = model.Mobile
        self.alternateTxtField.text = model.Alternate
        self.addressTxtField.text = model.Address
        self.cityTxtField.text = model.City
        self.zipCodeTxtField.text = model.ZipCode
        self.stateTxtField.text = model.State
        self.countryTxtField.text = model.Country
        self.gstnoTxtField.text = model.Gst
    }
    func getBillDetails() {
        WebServices.shared.getBilling(methodName: AppConstants.METHOD_GET_Billing_Details, Uniq: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, Type: "1",completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                let statusStr = String(status)
                switch(statusStr){
                case AppConstants.SUCCESS:
                    
                    let listArray: [[String: Any]] = response!["data"] as! [[String: Any]]
                    for list in listArray{
                    self.billModels.append(BillingModel(FirstName: list["firstname"] as! String, LastName: list["lastname"] as! String, Email: list["email"] as! String, Mobile: list["mobile"] as! String, Alternate: list["alternativemobile"] as! String, City: list["city"] as! String, ZipCode: list["zipcode"] as! String, State: list["state"] as! String, Country: list["country"] as! String, Address: list["address"] as! String, UserMobile: list["usermobile"] as! String, Gst: list["gst"] as! String, Pan: list["pan"] as! String, StateCode: list["statecode"] as! String, TaxState: list["taxstate"] as! String, type: list["type"] as! String, CompanyName: list["companyname"] as! String))
                    }
                    self.setUpLayout()
                case AppConstants.FAILED:
                    self.showToast(message: AppConstants.DNP)
                    
                default:
                    break
                }
            }
        })
        
    }
    func setBillDetails() {
        let model: BillingModel
        model = billModels[0]
        WebServices.shared.setBilling(methodName: AppConstants.METHOD_SET_Billing_Details, Uniq: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, Type: "1", FirstName: self.firstNameTxtField.text!, LastName: lastNameTxtField.text!, Email: emailTxtField.text!, Mobile: mobileTxtField.text!, AlterMobile: alternateTxtField.text!, City: cityTxtField.text!, ZipCode: zipCodeTxtField.text!, State: stateTxtField.text!, Country: countryTxtField.text!, Address: addressTxtField.text!, Gst: gstnoTxtField.text!, Pan: model.Pan, StateCode: model.StateCode, TaxState: model.TaxState, completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                let statusStr = String(status)
                switch(statusStr){
                case AppConstants.SUCCESS:
                      self.showToast(message: "Updated Successfuly")
                  
                case AppConstants.FAILED:
                    self.showToast(message: AppConstants.DNP)
                    
                default:
                    break
                }
            }
        })
        
    }
    
    
    //MARK: - IBOutlet Method
    @IBAction func submitClickedBtn(_ sender: Any) {
        guard firstNameTxtField.text != ""  else { showToast(message: "Enter First Name"); return }
        guard lastNameTxtField.text != ""  else { showToast(message: "Enter Last Name"); return }
        guard addressTxtField.text != ""  else { showToast(message: "Enter Address"); return }
        guard mobileTxtField.text != ""  else { showToast(message: "Invalid Mobile Number"); return }
        guard alternateTxtField.text != ""  else { showToast(message: "Invalid Optional Number"); return }
        guard emailTxtField.text != ""  else { showToast(message: "Invalid Email"); return }
        guard cityTxtField.text != ""  else { showToast(message: "Enter City"); return }
        guard zipCodeTxtField.text != ""  else { showToast(message: "Enter Zip Code"); return }
        guard stateTxtField.text != ""  else { showToast(message: "Enter State"); return }
        guard countryTxtField.text != ""  else { showToast(message: "Enter Country"); return }
        setBillDetails()
    }
}
